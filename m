Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 51D3E88DAE8
	for <lists+alsa-devel@lfdr.de>; Wed, 27 Mar 2024 11:03:35 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A1E6D2BF9;
	Wed, 27 Mar 2024 11:03:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A1E6D2BF9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1711533814;
	bh=jROsE5zSV1DOsWSD2Xb5OSOLWK6tS8GklG1SMe78Jf8=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=vURB+G3iIa2cOYVWXoxdlhZrY4vebQFDxxwrS+EGA8Mrycz2H/ho73y6a7P+/9JyT
	 Vm5CXXRUOezMTUvdESTTAmwPTnrZYB173ZQj274olDLCjj7NKvTquEwz3OBJ7fmTvc
	 lCa8wPbOKMs795V6COfGnD2qMmcAGlszoBxVPoQI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 73EE7F805AE; Wed, 27 Mar 2024 11:03:03 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A1400F805A8;
	Wed, 27 Mar 2024 11:03:02 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9CCCAF802DB; Wed, 27 Mar 2024 11:02:56 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_PASS,SPF_PASS
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from irl.hu (irl.hu [95.85.9.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with UTF8SMTPS id 5B87DF80093
	for <alsa-devel@alsa-project.org>; Wed, 27 Mar 2024 11:02:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5B87DF80093
Received: from [192.168.2.4] (51b68717.dsl.pool.telekom.hu
 [::ffff:81.182.135.23])
  (AUTH: CRAM-MD5 soyer@irl.hu, )
  by irl.hu with ESMTPSA
  id 0000000000075988.000000006603EEBD.0023F2B6;
 Wed, 27 Mar 2024 11:02:37 +0100
Message-ID: <a84dd52c7ff74f9c8b84ba2ce2f0a9c2c3f20dae.camel@irl.hu>
Subject: Re: [PATCH v1 7/8] ALSA: hda/tas2781: Add tas2781 SPI-based driver
From: Gergo Koteles <soyer@irl.hu>
To: Baojun Xu <baojun.xu@ti.com>, tiwai@suse.de
Cc: robh+dt@kernel.org, andriy.shevchenko@linux.intel.com,
  lgirdwood@gmail.com, perex@perex.cz,
  pierre-louis.bossart@linux.intel.com, kevin-lu@ti.com,
  13916275206@139.com, alsa-devel@alsa-project.org,
  linux-kernel@vger.kernel.org, liam.r.girdwood@intel.com,
  yung-chuan.liao@linux.intel.com, broonie@kernel.org
Date: Wed, 27 Mar 2024 11:02:37 +0100
In-Reply-To: <20240326010905.2147-7-baojun.xu@ti.com>
References: <20240326010905.2147-1-baojun.xu@ti.com>
	 <20240326010905.2147-7-baojun.xu@ti.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.4 (3.50.4-1.fc39) 
MIME-Version: 1.0
Message-ID-Hash: IIXZCJBO6USRJTNJKTBP4L6ALLPOYI3X
X-Message-ID-Hash: IIXZCJBO6USRJTNJKTBP4L6ALLPOYI3X
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/IIXZCJBO6USRJTNJKTBP4L6ALLPOYI3X/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Baojun,

On Tue, 2024-03-26 at 09:09 +0800, Baojun Xu wrote:
> Firmware binary load lib code for tas2781 spi driver.
>=20
> Signed-off-by: Baojun Xu <baojun.xu@ti.com>
> ---
>  sound/pci/hda/tas2781_spi_fwlib.c | 2374 +++++++++++++++++++++++++++++
>  1 file changed, 2374 insertions(+)
>  create mode 100644 sound/pci/hda/tas2781_spi_fwlib.c
>=20

Is this firmware loading logic the same as the already merged tas2781-
fmwlib? If yes, why don't you use that?

Thanks,
Gergo

