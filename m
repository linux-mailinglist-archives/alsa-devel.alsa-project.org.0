Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 40B1C2DC3A1
	for <lists+alsa-devel@lfdr.de>; Wed, 16 Dec 2020 17:00:27 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 360351830;
	Wed, 16 Dec 2020 16:59:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 360351830
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1608134426;
	bh=gNkmhZapJK7ExKO4GuwM2CQQ3uwNU2pVSyr4GJi37Gw=;
	h=Date:From:To:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=TP7sfKCPm0iOaHw9ElLYyp2vW23EKrPYYJzkSbjvA74npBZB0PegWPRNSIs2PuhxW
	 ZWYWy8lbekoauSBFhsN7td/2qZNw5CTGPDKBRRzqFnwuYGN8t9meuy+jJclqhZhdbs
	 LE6pSqEIUBOC/4nd2zS5HyxBr0jDZVR7traIa2rk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 93A15F804C2;
	Wed, 16 Dec 2020 16:59:17 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 31D5DF80278; Tue, 15 Dec 2020 19:09:18 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com
 [IPv6:2a00:1450:4864:20::644])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6B1CEF8014B
 for <alsa-devel@alsa-project.org>; Tue, 15 Dec 2020 19:09:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6B1CEF8014B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="I06WjCTX"
Received: by mail-ej1-x644.google.com with SMTP id j22so11041845eja.13
 for <alsa-devel@alsa-project.org>; Tue, 15 Dec 2020 10:09:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:subject:message-id:mime-version:content-disposition;
 bh=B6qNOoqltxeloTXeSJiHEsnoejIa/iODS20XwCdkukE=;
 b=I06WjCTXP6nt0NcJ4l9hrmmdC4x5Wr3mD7g/3+g47lfmJROVVwEqeSAEdsgVyJGHHI
 Joq9c5J2ASwOvmK4fiiXF75pCyJOBnQLfppU3RuX0fNdixt8ycqBEZHd/c5qJWz4nX0Q
 EDvPaZkFNo+g6+4Vo7ksT55RaAahBTObBDJZdsX6lGM+H9c8bCnzDDiRcQ4ODHwR6R0v
 pnnCXmUG7PP3L09bd4VyyOvk7BRIuylgd6muDn4XC/HndhFZme50cP9Ur4gkg0qgXDq8
 GAsbP8eLfJkX3ur0v9XMU0qDL91hS5HjE9f5zTlWscdZST7f9pEqNSv/UsdBbkaPcQ9h
 rMDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:subject:message-id:mime-version
 :content-disposition;
 bh=B6qNOoqltxeloTXeSJiHEsnoejIa/iODS20XwCdkukE=;
 b=rLzkAU2Mcsgct9VfDWIc6cH4EpaOq2JHU5kxhL9Wl5VFn20U15dlmXmmo+AEikEVUF
 baxlRoJS0ugbvrYxs4k2AITFHW5gfW65R2kGE0QWlHZbmu5Ehq2Hhz8VeRuJpsmO7M2L
 Ni3gc2Kq3H/HR+NEj2gA3MfvZlGy4ofhQib+yTIecdKCz28j2iVJC6x06XyIFGCeN7PB
 w/Gx9happXnHciNFwRfeEXZJBbfY++6F5t23m2HuaZriy9U8nmN7h3wz1janmvxJXwtI
 4XHUPWVf1BtoPlbATucSppcGgSX4B/J56QoJyTaULMHaKhLX7hS91EuK7g8Sb2GZNkVk
 fqcg==
X-Gm-Message-State: AOAM532lFXUHayt8AS/Ye5ga1qZmYZy7HVN2khsHMREsxk49088e6AC+
 H/ovLkxedEGLE0Swx7TOWRkVG3f8mVqxwsqS
X-Google-Smtp-Source: ABdhPJz2IO79O71SXC9aCfFIDMOxVeNrshREHXMOkjWqAkXsEWBqIPfft4fwsgVURupKoiNMMTxNVA==
X-Received: by 2002:a17:906:4304:: with SMTP id
 j4mr27386530ejm.304.1608055748031; 
 Tue, 15 Dec 2020 10:09:08 -0800 (PST)
Received: from ryzen.localdomain (89-212-27-98.dynamic.t-2.net. [89.212.27.98])
 by smtp.gmail.com with ESMTPSA id n2sm1924842ejj.24.2020.12.15.10.09.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Dec 2020 10:09:07 -0800 (PST)
Date: Tue, 15 Dec 2020 19:09:05 +0100
From: Amadej Kastelic <amadejkastelic7@gmail.com>
To: perex@perex.cz, tiwai@suse.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 01/01] Add VID to support native DSD reproduction on FiiO
 devices.
Message-ID: <X9j7wdXSr4XyK7Bd@ryzen.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailman-Approved-At: Wed, 16 Dec 2020 16:59:14 +0100
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

Message-Id: <c759bc50134ea434bfed0a183e0ce72984f5b609.camel@gmail.com>

Add VID to support native DSD reproduction on FiiO devices.

Tested-by: Amadej Kastelic <amadejkastelic7@gmail.com>
Signed-off-by: Emilio Moretti <emilio.moretti@gmail.com>
---
 sound/usb/quirks.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/usb/quirks.c b/sound/usb/quirks.c
index 349e1e52996d..f5fc65aef628 100644
--- a/sound/usb/quirks.c
+++ b/sound/usb/quirks.c
@@ -1658,6 +1658,7 @@ u64 snd_usb_interface_dsd_format_quirks(struct snd_usb_audio *chip,
 	case 0x25ce:  /* Mytek devices */
 	case 0x278b:  /* Rotel? */
 	case 0x292b:  /* Gustard/Ess based devices */
+	case 0x2972:  /* FiiO devices */
 	case 0x2ab6:  /* T+A devices */
 	case 0x3842:  /* EVGA */
 	case 0xc502:  /* HiBy devices */
--
2.20.1
