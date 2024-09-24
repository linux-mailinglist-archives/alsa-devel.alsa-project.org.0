Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 22A2698BC31
	for <lists+alsa-devel@lfdr.de>; Tue,  1 Oct 2024 14:36:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3F80DDF6;
	Tue,  1 Oct 2024 14:36:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3F80DDF6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1727786218;
	bh=zql0UFyD9e6gEijJF+6zQpiD0eDyWRmtczoPGlBcpfI=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=nWwtzmQ5HIJ63tUPuBjQqhfyoHJaFZ7kRZl7IAh3iZ3s9iCcCQygFF3BKG33nYW0s
	 8KSBXFFO0XEUONkdaA2iQOvfvO3TMDrS+aI0R1vm1zVtx31jwjrW/srLXyb3MbRoxl
	 pXNgJioWUrZ4AgjkuPTOVLUEXqbk2gDe1xowe3+Q=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B7BD0F80692; Tue,  1 Oct 2024 14:35:18 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BC656F80692;
	Tue,  1 Oct 2024 14:35:17 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 90E20F802DB; Tue, 24 Sep 2024 13:28:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.153.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id BC861F8010B
	for <alsa-devel@alsa-project.org>; Tue, 24 Sep 2024 13:27:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BC861F8010B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=microchip.com header.i=@microchip.com
 header.a=rsa-sha256 header.s=mchp header.b=XyVcXfuP
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1727177281; x=1758713281;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=zql0UFyD9e6gEijJF+6zQpiD0eDyWRmtczoPGlBcpfI=;
  b=XyVcXfuPIrQIWy/XnF0GwKhd+il7Zgv4SKoG7pwoR8PP4MYEqYFw6/3g
   l5zA7LFiaBd8Svlh99l8+igrm0lBioUrR67ISPgEdZGaHkjwsy3jd9trP
   eMrLbBVM5Xheettwi9YGs1PLxjhWHiOQTXPlg/GuCsgm2tYpTiN+JeoVq
   2EpNp7FFsl72dFKpk0qIvEx218i8hxDraYGZpuNTjKYOYMNgmPf42MpeN
   MMwGZV5d1Uj+ofMzzseP7VzN3/VU4BQfjGYwap2Hn3SVAlcEP9UMpeC1O
   ddKQYguZupPV6kqIbQD6R5RoV9LgxPRNt6F3lwdg1npO843JcJQ5NkgPY
   g==;
X-CSE-ConnectionGUID: gLqVBAZkQqmoxUm1padfyg==
X-CSE-MsgGUID: ej1v0jdzRl+8yr6Hszmyog==
X-IronPort-AV: E=Sophos;i="6.10,254,1719903600";
   d="scan'208";a="32166627"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 24 Sep 2024 04:27:57 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 24 Sep 2024 04:27:27 -0700
Received: from ROB-ULT-M76677.microchip.com (10.10.85.11) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Tue, 24 Sep 2024 04:27:24 -0700
From: Andrei Simion <andrei.simion@microchip.com>
To: <broonie@kernel.org>
CC: <alexandre.belloni@bootlin.com>, <alsa-devel@alsa-project.org>,
	<andrei.simion@microchip.com>, <claudiu.beznea@tuxon.dev>,
	<lgirdwood@gmail.com>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-sound@vger.kernel.org>,
	<nicolas.ferre@microchip.com>, <perex@perex.cz>, <tiwai@suse.com>
Subject: Re: [PATCH] ASoC: atmel: mchp-pdmc: Skip ALSA restoration if
 substream runtime is uninitialized
Date: Tue, 24 Sep 2024 14:25:44 +0300
Message-ID: <20240924112542.78321-1-andrei.simion@microchip.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <ZvJ_ZFpIiRpD_uzO@finisterre.sirena.org.uk>
References: <ZvJ_ZFpIiRpD_uzO@finisterre.sirena.org.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MailFrom: prvs=99060207b=Andrei.Simion@microchip.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: 2T6D63NUKSIIX6C47MALQVKMVFBDP65V
X-Message-ID-Hash: 2T6D63NUKSIIX6C47MALQVKMVFBDP65V
X-Mailman-Approved-At: Tue, 01 Oct 2024 12:34:51 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2T6D63NUKSIIX6C47MALQVKMVFBDP65V/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 24.09.2024 11:59, Mark Brown wrote:
> 
> 
> On Tue, Sep 24, 2024 at 11:12:38AM +0300, Andrei Simion wrote:
> 
>> Update the driver to prevent alsa-restore.service from failing when
>> reading data from /var/lib/alsa/asound.state at boot. Ensure that the
>> restoration of ALSA mixer configurations is skipped if substream->runtime
>> is NULL.
>> +++ b/sound/soc/atmel/mchp-pdmc.c
>> @@ -302,6 +302,9 @@ static int mchp_pdmc_chmap_ctl_put(struct snd_kcontrol *kcontrol,
>>	if (!substream)
>>		return -ENODEV;
>>
>> +	if (!substream->runtime)
>> +		return 0; /* just for avoiding error from alsactl restore */
>> +
> This then means that control writes are just discarded which presumably
> is going to upset things if they actually saved a value here.  Why is
> that a good choice, rather than either fixing the race so the card
> doesn't come up too early or removing the need for the runtime?

Ok. I understand. My first intention was to follow the
https://github.com/torvalds/linux/blob/master/sound/hda/hdmi_chmap.c#L794
but after your point of view, I intend to return -EAGAIN in V2
to specify the substream->runtime is not ready.

I retested: configured pdmc, then reboot the board and the configuration:
as a result the configuration kept.

alsa-restore.service status success.

Do you think this solution is enough?

Thank you and best regards,
Andrei Simion
