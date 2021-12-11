Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 421F6471605
	for <lists+alsa-devel@lfdr.de>; Sat, 11 Dec 2021 21:06:52 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A79F71B11;
	Sat, 11 Dec 2021 21:06:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A79F71B11
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1639253211;
	bh=qeCm/LKaezkiKrTscTfvAMTl8B5t7FsCgi2rQzCUItE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Vm0cct0NjVuZZVA2Pp41CeQTBEJTl1SwJtkfvsWTZ2bwKlsmtiskOpV0I8bkWE3JD
	 YzNQiTY2QWdpx55+7oozA/2Yno/Q0EB8I6hzqSp0wXMpMT3IJoOfZpMJ0vH8j4FkJm
	 69ZLVVXK0PUnXQ+2BZDkmsDQADMla52d2ZX1OxuI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 09900F804CF;
	Sat, 11 Dec 2021 21:05:44 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3D1B4F804CC; Sat, 11 Dec 2021 21:05:40 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_76,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4A71EF804AE
 for <alsa-devel@alsa-project.org>; Sat, 11 Dec 2021 21:05:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4A71EF804AE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="puBnUmRF"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id DC734B80B41
 for <alsa-devel@alsa-project.org>; Sat, 11 Dec 2021 20:05:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ABDCEC004DD
 for <alsa-devel@alsa-project.org>; Sat, 11 Dec 2021 20:05:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1639253128;
 bh=qeCm/LKaezkiKrTscTfvAMTl8B5t7FsCgi2rQzCUItE=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=puBnUmRFUOjWrx+LwEOma2RsAt0l+p/1YivjU5rXFjlecFvUcUAgULA95uSYH2oQm
 FDFpIXZfLf5kmjwUnC9ts/GCuXLoBmIbPQqccT9rdqjYfp7P87nk2jyQ7obvC+zsZ+
 gVvOjaLHALfo7rvIPDkZhQxyW+bvfRQem0+jYvgNaXOUXo+VwTHcUG2mbq1d3tdEYG
 pD+jemFrpzvk1l1L3T8kqwiJaG2I3+Z+JVE2zI1HVYDpnjg+Lya4vHoztPKM0hCblb
 og6uJmLNCxd+AWMTeDDFma/20SAPr0m+ytn4x4/BIl2J7sSd6auhmcujAjl+nqm6lP
 XRLdtDQiYPYng==
Received: by mail-ed1-f44.google.com with SMTP id y13so39618677edd.13
 for <alsa-devel@alsa-project.org>; Sat, 11 Dec 2021 12:05:28 -0800 (PST)
X-Gm-Message-State: AOAM533V/tGh8EBpA0gYH00ywyFFOY27MW6WXixqyhTlixacJ0fY3uK3
 ANvrEV5NxP2KhZBLxTZjMErKQfmgo+OH9Z+R7g==
X-Google-Smtp-Source: ABdhPJz6oQ9/ea55Af7SWA6OUXDM4KBuM9Bev/q3Uf53wZn1RxRMeyn57YfpSjZuONVgP96T1zkE3DQebWnJ1Q7LP+0=
X-Received: by 2002:a05:6402:440f:: with SMTP id
 y15mr50056378eda.22.1639253126974; 
 Sat, 11 Dec 2021 12:05:26 -0800 (PST)
MIME-Version: 1.0
References: <20211125144053.774-1-olivier.moysan@foss.st.com>
 <20211125144053.774-2-olivier.moysan@foss.st.com>
 <1637875562.357461.2858318.nullmailer@robh.at.kernel.org>
 <237f56b3-0597-2526-a182-f1fbdd327338@foss.st.com>
 <Yaf4jiZIp8+ndaXs@robh.at.kernel.org>
 <627777a4-7458-88ed-e7c5-d11e3db847b5@foss.st.com>
In-Reply-To: <627777a4-7458-88ed-e7c5-d11e3db847b5@foss.st.com>
From: Rob Herring <robh@kernel.org>
Date: Sat, 11 Dec 2021 14:05:15 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+ZVU=DR0vXq6YOsrK9-MoUp5DJ6RKHmtL-ZGSxQ7qyJQ@mail.gmail.com>
Message-ID: <CAL_Jsq+ZVU=DR0vXq6YOsrK9-MoUp5DJ6RKHmtL-ZGSxQ7qyJQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] ASoC: dt-bindings: stm32: i2s: add
 audio-graph-card port
To: Alexandre TORGUE <alexandre.torgue@foss.st.com>
Content-Type: text/plain; charset="UTF-8"
Cc: devicetree@vger.kernel.org, Linux-ALSA <alsa-devel@alsa-project.org>,
 Olivier Moysan <olivier.moysan@st.com>,
 Olivier MOYSAN <olivier.moysan@foss.st.com>, Mark Brown <broonie@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Amelie Delaunay <amelie.delaunay@foss.st.com>,
 Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alain Volmat <alain.volmat@foss.st.com>,
 Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
 "moderated list:ARM/STM32 ARCHITECTURE"
 <linux-stm32@st-md-mailman.stormreply.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Tue, Dec 7, 2021 at 7:52 AM Alexandre TORGUE
<alexandre.torgue@foss.st.com> wrote:
>
> Hi Rob
>
> On 12/1/21 11:34 PM, Rob Herring wrote:
> > On Fri, Nov 26, 2021 at 11:25:27AM +0100, Olivier MOYSAN wrote:
> >> Hi Rob,
> >>
> >> On 11/25/21 10:26 PM, Rob Herring wrote:
> >>> On Thu, 25 Nov 2021 15:40:50 +0100, Olivier Moysan wrote:
> >>>> The STM2 I2S DAI can be connected via the audio-graph-card.
> >>>> Add port entry into the bindings.
> >>>>
> >>>> Signed-off-by: Olivier Moysan <olivier.moysan@foss.st.com>
> >>>> ---
> >>>>    Documentation/devicetree/bindings/sound/st,stm32-i2s.yaml | 5 +++++
> >>>>    1 file changed, 5 insertions(+)
> >>>>
> >>>
> >>> Running 'make dtbs_check' with the schema in this patch gives the
> >>> following warnings. Consider if they are expected or the schema is
> >>> incorrect. These may not be new warnings.
> >>>
> >>> Note that it is not yet a requirement to have 0 warnings for dtbs_check.
> >>> This will change in the future.
> >>>
> >>> Full log is available here: https://patchwork.ozlabs.org/patch/1559750
> >>>
> >>>
> >>> audio-controller@4000b000: 'port' does not match any of the regexes: '^port@[0-9]', 'pinctrl-[0-9]+'
> >>>     arch/arm/boot/dts/stm32mp157a-dk1.dt.yaml
> >>>     arch/arm/boot/dts/stm32mp157c-dk2.dt.yaml
> >>>
> >>
> >> This warning is not a new one.
> >>
> >> The i2s2 node in stm32mp15xx-dkx.dtsi would require the following binding:
> >> port:
> >>      $ref: audio-graph-port.yaml#
> >>      unevaluatedProperties: false
> >>
> >> However the spi binding requires to introduce a unit address:
> >> patternProperties:
> >>    '^port@[0-9]':
> >>      $ref: audio-graph-port.yaml#
> >>      unevaluatedProperties: false
> >>
> >> The warning can be removed by re-ordering the bindings patches in the serie,
> >> as "additionalProperties: true" makes the check more tolerant on extra
> >> properties.
> >
> > That's never right.
> >
> >> The patch "ASoC: dt-bindings: stm32: i2s: add audio-graph-card port" can
> >> even be merely dropped.
> >> So, I suggest to resend the serie without audio-graph-card patch.
> >
> > Only if you aren't using audio-graph-card.
> >
> >>
> >> Does it sound too permissive to you ?
> >
> > I think perhaps you need to combine the schemas into 1. Or you need to
> > restructure your dtsi files such that you only add spi specific
> > properties when spi mode is enabled and only add i2s specific properties
> > when i2s mode is enabled. Or use the /delete-property/ directive.
>
> Initially the aim of this series was to fix a "make W=1" warnings seen
> on spi and i2s nodes (duplicate unit-address). Moving both nodes in a
> common node + using a different compatible depending on SPI or I2S usage
> sounded good) but it is not enough. In this series the common node is
> named as following: "spi2s2: spi@4000b000". It is fine for a spi usage
> but if we want to use this "common node" with I2S compatible and
> specific bindings, the node name remains spi@... and then specific spi
> checks are done. For this with this series applied we got this issue
> reported by spi-controller.yaml:
>
> spi@4000b000: port@0: 'compatible' is a required property
>
> So, if we use two separates nodes we got W=1 warning and if we use a
> common node we got yaml check issue. One possibility would be to use a
> common node with a new node name (for example i2spi@...) but I think it
> is not acceptable.

It is acceptable, see this thread[1].

Rob

[1] https://lore.kernel.org/all/20211203183517.11390-1-semen.protsenko@linaro.org/
