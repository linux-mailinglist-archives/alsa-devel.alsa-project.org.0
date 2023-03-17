Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 84F536BEB30
	for <lists+alsa-devel@lfdr.de>; Fri, 17 Mar 2023 15:29:08 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 75861F64;
	Fri, 17 Mar 2023 15:28:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 75861F64
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1679063347;
	bh=Ja0gXd3YfBR6uYrUbXl92wXVqvLZJFGUpGHdiwj+ROI=;
	h=References:In-Reply-To:From:Date:Subject:To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=WlfyHep0YkUau+uFKJnXTx/JcgjfXcyeqPA/CgmHAe+I7vA018t6oxgkHep4I95H9
	 rVw5R2zVjmBG06jLdKPE01MgwJOiN8VpM0Y63eKszYKoRKmKAbarp9NTCIn4n8cU9b
	 U8o8/mgQz5Oj7K5K86aWinfeh5RISutWnT0UQxG0=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A0C3DF8032D;
	Fri, 17 Mar 2023 15:28:16 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3111CF80423; Fri, 17 Mar 2023 15:28:11 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id BDC4DF80272
	for <alsa-devel@alsa-project.org>; Fri, 17 Mar 2023 15:28:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BDC4DF80272
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=mdwCqXGq
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id EF80DB8254C
	for <alsa-devel@alsa-project.org>; Fri, 17 Mar 2023 14:27:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96B35C433AA
	for <alsa-devel@alsa-project.org>; Fri, 17 Mar 2023 14:27:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1679063277;
	bh=Ja0gXd3YfBR6uYrUbXl92wXVqvLZJFGUpGHdiwj+ROI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=mdwCqXGqNep4EKAupw8jzfhWRrjq79YWH/MMQgK3tQSZC3hiyuYvbCWPTxwxLwpHJ
	 FhfR3yNKFqj/NDBbszx/GvZ/J3/VMSeXoWCDwzES0AjdQiL1tvLD0BBMZ//FgxkrFf
	 rRZHPmusSP2wcH9FuRjE8NFAqd7RVcTHkYI4fFrxuBQTLwnCSup5sz3Pq3dyCuOkyy
	 Yi4E+sbyIKDivzUMuGYa8qkS9ILxgOwMjxYArHb//UyvvSyvqI8tHbgy89AH02HhIV
	 agzW+EDeGvYcmM54DsDVhSg7ETaaEAxyM6Q15ke0yOFXafWjNuoaAIC7GScvP7ngF8
	 BGyMe2skQ+W4w==
Received: by mail-ua1-f54.google.com with SMTP id v48so3452833uad.6
        for <alsa-devel@alsa-project.org>;
 Fri, 17 Mar 2023 07:27:57 -0700 (PDT)
X-Gm-Message-State: AO0yUKUYq0coISpQpJB4olYY/9rEtvESBG8MqMEXtm68PHaZNyDg++iV
	GTaGeSsjXqR1UMNmBACRG9d3KfOu6cZsika6+Q==
X-Google-Smtp-Source: 
 AK7set+opXfvV0KuRUWrTn9+KJEXDQa7roIGehinVec3htJJWc+YaBCYf2jrEie3nmO3df834BaxB7f6VqlHHcNfwWw=
X-Received: by 2002:a1f:2cd7:0:b0:401:73f4:dfe with SMTP id
 s206-20020a1f2cd7000000b0040173f40dfemr8088vks.3.1679063276330; Fri, 17 Mar
 2023 07:27:56 -0700 (PDT)
MIME-Version: 1.0
References: <20230315114806.3819515-1-cristian.ciocaltea@collabora.com>
 <20230315114806.3819515-2-cristian.ciocaltea@collabora.com>
 <20230316203417.GA3833267-robh@kernel.org>
 <20230316222619.r4jzk3lzdxzamr2s@bogus>
 <d5881d9f-90cc-f7a2-72a3-0701348a03fe@collabora.com>
In-Reply-To: <d5881d9f-90cc-f7a2-72a3-0701348a03fe@collabora.com>
From: Rob Herring <robh@kernel.org>
Date: Fri, 17 Mar 2023 09:27:44 -0500
X-Gmail-Original-Message-ID: 
 <CAL_JsqL_EogoKOQ1xwU75=rJSC4o7yV3Jej4vadtacX2Pt3-hw@mail.gmail.com>
Message-ID: 
 <CAL_JsqL_EogoKOQ1xwU75=rJSC4o7yV3Jej4vadtacX2Pt3-hw@mail.gmail.com>
Subject: Re: [PATCH 01/11] dt-bindings: firmware: arm,scmi: Document
 assigned-clocks and assigned-clock-rates
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: 3TPZRHKIIEIALNCC4G5YBIFORFHGJ543
X-Message-ID-Hash: 3TPZRHKIIEIALNCC4G5YBIFORFHGJ543
X-MailFrom: robh@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Sudeep Holla <sudeep.holla@arm.com>, Stephen Boyd <sboyd@kernel.org>,
 Cristian Marussi <cristian.marussi@arm.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Nicolas Frattaroli <frattaroli.nicolas@gmail.com>,
 Heiko Stuebner <heiko@sntech.de>, Takashi Iwai <tiwai@suse.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Daniel Drake <drake@endlessm.com>,
 Katsuhiro Suzuki <katsuhiro@katsuster.net>,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-rockchip@lists.infradead.org,
 linux-riscv@lists.infradead.org, kernel@collabora.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3TPZRHKIIEIALNCC4G5YBIFORFHGJ543/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, Mar 17, 2023 at 4:59=E2=80=AFAM Cristian Ciocaltea
<cristian.ciocaltea@collabora.com> wrote:
>
> On 3/17/23 00:26, Sudeep Holla wrote:
> > On Thu, Mar 16, 2023 at 03:34:17PM -0500, Rob Herring wrote:
> >> +Stephen
> >>
> >> On Wed, Mar 15, 2023 at 01:47:56PM +0200, Cristian Ciocaltea wrote:
> >>> Since commit df4fdd0db475 ("dt-bindings: firmware: arm,scmi: Restrict
> >>> protocol child node properties") the following dtbs_check warning is
> >>> shown:
> >>>
> >>>    rk3588-rock-5b.dtb: scmi: protocol@14: Unevaluated properties are =
not allowed ('assigned-clock-rates', 'assigned-clocks' were unexpected)
> >>
> >> I think that's a somewhat questionable use of assigned-clock-rates. It
> >> should be located with the consumer rather than the provider IMO. The
> >> consumers of those 2 clocks are the CPU nodes.
> >>
> >
> > Agreed. We definitely don't use those in the scmi clk provider driver.
> > So NACK for the generic SCMI binding change.
>
> According to [1], "configuration of common clocks, which affect multiple
> consumer devices can be similarly specified in the clock provider node".

True, but in this case it's really a single consumer because it's all
CPU nodes which are managed together.

> That would avoid duplicating assigned-clock-rates in the CPU nodes.

Wouldn't one node be sufficient?

Thinking more about this, why aren't you using OPP tables to define
CPU frequencies. Assigned-clocks looks like a temporary hack because
you haven't done proper OPP tables.

Rob
