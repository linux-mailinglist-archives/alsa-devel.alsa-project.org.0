Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 026F6814AE7
	for <lists+alsa-devel@lfdr.de>; Fri, 15 Dec 2023 15:45:23 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7F780E74;
	Fri, 15 Dec 2023 15:45:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7F780E74
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1702651522;
	bh=NdPL7A8hFPcOA3gXprhugTDaREwe79N4flRzAFjq8XQ=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Sk5HDoHN2X80qU3cA32VcWnoGwEY0jRXTVKcLp5pzHPTh4t1ecvgPcnsvwhRxvjKy
	 Cs3ccabeZp7zrMGYQw9Pm2JX3RYnWYtFnRLOW96Eg6AKpa+D71kJfnqssf9yj4JXEM
	 YD9b9wISm2Y7tz2txoWFCN3X/NRiejRD2iXQpbD0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EB2BEF805F3; Fri, 15 Dec 2023 15:43:07 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6B2EBF805F3;
	Fri, 15 Dec 2023 15:43:07 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4E5B4F805AA; Fri, 15 Dec 2023 15:43:03 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=RCVD_IN_DNSWL_HI,
	RCVD_IN_SORBS_HTTP,RCVD_IN_SORBS_SOCKS,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=unavailable
	autolearn_force=no version=3.4.6
Received: from irl.hu (irl.hu [95.85.9.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with UTF8SMTPS id 1E0D0F805C5
	for <alsa-devel@alsa-project.org>; Fri, 15 Dec 2023 15:42:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1E0D0F805C5
Received: from [192.168.2.4] (51b687c3.dsl.pool.telekom.hu
 [::ffff:81.182.135.195])
  (AUTH: CRAM-MD5 soyer@irl.hu, )
  by irl.hu with ESMTPSA
  id 00000000000718F7.00000000657C65E3.0012E612;
 Fri, 15 Dec 2023 15:42:43 +0100
Message-ID: <f135963cb14d9bef6cddbe0bd1ce0aaa6d4ac7d9.camel@irl.hu>
Subject: Re: [PATCH 03/16] ASoC: tas2781: disable regmap regcache
From: Gergo Koteles <soyer@irl.hu>
To: Mark Brown <broonie@kernel.org>
Cc: Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
  Baojun Xu <baojun.xu@ti.com>, Jaroslav Kysela <perex@perex.cz>,
  Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
  linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org
Date: Fri, 15 Dec 2023 15:42:43 +0100
In-Reply-To: <5b2eb7eb-761e-406d-8d55-b7ea8cddefa8@sirena.org.uk>
References: <cover.1701906455.git.soyer@irl.hu>
	 <21a183b5a08cb23b193af78d4b1114cc59419272.1701906455.git.soyer@irl.hu>
	 <0b836c10-b21b-4275-8dd0-254dd5467497@sirena.org.uk>
	 <47097f19398808b64f4cc87c2a3c7cc462fb2416.camel@irl.hu>
	 <5f3f0306-799f-4f3b-9e05-fbd300c59d5d@sirena.org.uk>
	 <b0ab21657f2e4f0825579de97ca012e294d1e743.camel@irl.hu>
	 <bf24488f-e4e1-4d3e-a67e-fe74c05acda4@sirena.org.uk>
	 <9a2b85a8a19e002093e2471a97850d26e335900f.camel@irl.hu>
	 <5b2eb7eb-761e-406d-8d55-b7ea8cddefa8@sirena.org.uk>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.2 (3.50.2-1.fc39) 
MIME-Version: 1.0
Message-ID-Hash: 7BJDM25ZWQZM7DS7TIVQDBUEAKCZ3T2O
X-Message-ID-Hash: 7BJDM25ZWQZM7DS7TIVQDBUEAKCZ3T2O
X-MailFrom: soyer@irl.hu
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7BJDM25ZWQZM7DS7TIVQDBUEAKCZ3T2O/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 2023-12-15 at 12:55 +0000, Mark Brown wrote:
> On Fri, Dec 15, 2023 at 02:17:01AM +0100, Gergo Koteles wrote:
> > On Thu, 2023-12-07 at 22:39 +0000, Mark Brown wrote:
> > > On Thu, Dec 07, 2023 at 10:12:13PM +0100, Gergo Koteles wrote:
> > > > On Thu, 2023-12-07 at 20:36 +0000, Mark Brown wrote:
>=20
> > > > > The code creates the impression that writing to one tas2781 write=
s to
> > > > > all of them, is that not the case?
>=20
> > > > Yes, the tasdevice_* functions, but the regcache_sync doesn't know
> > > > this.
>=20
> > > So this syncing is done in software not hardware?  My understanding w=
as
> > > that this was a hardware thing.
>=20
> > If you mean that the amplifier does not know that there are several
> > programs or configurations or profiles, but only runs the current one,
> > yes.
>=20
> No, I mean that the amplifiers don't talk to each other at a hardware
> level and the grouping is all in software.

No, they don't talk to each other. But they have a global i2c address
to speed up configuration, but the module doesn't use it yet.

