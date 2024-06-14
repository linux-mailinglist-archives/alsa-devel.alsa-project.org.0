Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 57D11908F47
	for <lists+alsa-devel@lfdr.de>; Fri, 14 Jun 2024 17:47:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 794D5845;
	Fri, 14 Jun 2024 17:46:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 794D5845
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1718380027;
	bh=G8B8akW16zGg8zUlOix/RFqn7c0bYnlcLHUwDty6SOo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=E2+H54CDlNNB4flNBtbI6ZdVlabit4KUkZQme5xQyAFWUo1tzHZIAot5QZLwG9mKl
	 8Y6ii290AZYoTl+TqeQpdxAdaHvaQSCFqz2BfpKFBiDiXEFimgThthTqxu+zffq4Fy
	 8heF8XhvU0+HfgsUksLzNzmc4xCBRexQnhGvNe7w=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 29585F805A9; Fri, 14 Jun 2024 17:46:31 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C0623F805AD;
	Fri, 14 Jun 2024 17:46:29 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 47A4FF80448; Fri, 14 Jun 2024 17:41:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED,
	SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from smtp.smtpout.orange.fr (smtp-26.smtpout.orange.fr
 [80.12.242.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C8C51F800E9
	for <alsa-devel@alsa-project.org>; Fri, 14 Jun 2024 17:41:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C8C51F800E9
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=wanadoo.fr header.i=@wanadoo.fr header.a=rsa-sha256
 header.s=t20230301 header.b=rhLNILGX
Received: from [192.168.1.37] ([86.243.222.230])
	by smtp.orange.fr with ESMTPA
	id I93YsIab3c2iUI93Yse5qb; Fri, 14 Jun 2024 17:41:46 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1718379706;
	bh=fMkYys7M3zvaEsKBAT2YIbRf9BEpH1IjB7DODovtk1w=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=rhLNILGXGh6aZy8/ZRpK3rclBOuHKCCxpwcPv0Hhqjvh0e+xj4zkrYdYkzN51+IzO
	 1A7ebratQJgPPg7UOz4eMBXylChdfGeMEK9rBNIKG7RCRUhtR/jKQTAO9JKgvXdl4y
	 bLb1dFMa61l7Vixmqo2HriueRmAc0t9RHPN30bpm5zEcKmdnPZYESj557sUlHdpi3c
	 bMJDrcajhRAij70CcfBXO/l/Yrjd9AnTFu7FepxREKkV6nTd0PAi75hkS7wUPCbsiS
	 5e4fEamEtnPCSBfswOQtnBg+rpzSc8T+bM54+D+M0sN8j784Pa2pe2GSxbLDsNQaz1
	 wVMwtr8UiyOYw==
X-ME-Helo: [192.168.1.37]
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Fri, 14 Jun 2024 17:41:46 +0200
X-ME-IP: 86.243.222.230
Message-ID: <d6428e19-986d-4451-bfcf-17705cc9e53b@wanadoo.fr>
Date: Fri, 14 Jun 2024 17:41:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8] ALSA: hda/tas2781: Add tas2781 hda SPI driver
To: Baojun Xu <baojun.xu@ti.com>, tiwai@suse.de
Cc: robh+dt@kernel.org, andriy.shevchenko@linux.intel.com,
 lgirdwood@gmail.com, perex@perex.cz, pierre-louis.bossart@linux.intel.com,
 kevin-lu@ti.com, shenghao-ding@ti.com, navada@ti.com, 13916275206@139.com,
 v-hampiholi@ti.com, v-po@ti.com, niranjan.hy@ti.com,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 liam.r.girdwood@intel.com, yung-chuan.liao@linux.intel.com,
 broonie@kernel.org, soyer@irl.hu
References: <20240614040554.610-1-baojun.xu@ti.com>
Content-Language: en-MW
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <20240614040554.610-1-baojun.xu@ti.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Message-ID-Hash: ALGR46HPKE42K247VYPP6YXZTT3DIGUJ
X-Message-ID-Hash: ALGR46HPKE42K247VYPP6YXZTT3DIGUJ
X-MailFrom: christophe.jaillet@wanadoo.fr
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ALGR46HPKE42K247VYPP6YXZTT3DIGUJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Le 14/06/2024 à 06:05, Baojun Xu a écrit :
> This patch was used to add TAS2781 devices on SPI support in sound/pci/hda.
> It use ACPI node descript about parameters of TAS2781 on SPI, it like:
>      Scope (_SB.PC00.SPI0)
>      {
>          Device (GSPK)
>          {
>              Name (_HID, "TXNW2781")  // _HID: Hardware ID
>              Method (_CRS, 0, NotSerialized)
>              {
>                  Name (RBUF, ResourceTemplate ()
>                  {
>                      SpiSerialBusV2 (...)
>                      SpiSerialBusV2 (...)
>                  }
>              }
>          }
>      }
> 
> And in platform/x86/serial-multi-instantiate.c, those spi devices will be
> added into system as a single SPI device, so TAS2781 SPI driver will
> probe twice for every single SPI device. And driver will also parser
> mono DSP firmware binary and RCA binary for itself.
> The code support Realtek as the primary codec.
> 
> Signed-off-by: Baojun Xu <baojun.xu@ti.com>
> 
> ---

Hi,

not a must-have but using "checkpatch.pl --strict" could slightly 
improve readability in some places.

Maybe at least,
    - ./scripts/checkpatch.pl --strict --test-only=Blank
      --> to save a few LoC

    - ./scripts/checkpatch.pl --strict --test-only=parentheses
      --> to improve readability and reduce the length of some lines


This is already v8, so feel free to just ignore this mail and the 
--strict option.

CJ
