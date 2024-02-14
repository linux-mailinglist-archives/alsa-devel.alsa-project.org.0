Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A036A85B457
	for <lists+alsa-devel@lfdr.de>; Tue, 20 Feb 2024 09:03:00 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 182267F4;
	Tue, 20 Feb 2024 09:02:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 182267F4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1708416180;
	bh=Xx9qKGdssRAp5mo/Ka75lHZUssh4sDREhVlfbYK5MNo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=EIVxh+RU+IANy7xn3RYBD7/skPLMoyf97bTAUxjPQu9nMKjq8oPVNwg27VqG9Bogp
	 f0iYydenCPZgS40aXhxk/WINZnDLVXGAWKMSpNQ2sndBjEU7cCIbUatXLkDeqgDfKv
	 4SNEDhatcBT3UnLu5kj1SEX50noEfnvmtTjOcchQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id ADB76F805FC; Tue, 20 Feb 2024 09:01:57 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 45BD8F805F4;
	Tue, 20 Feb 2024 09:01:57 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9A8CEF80568; Wed, 14 Feb 2024 20:28:16 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ot1-x331.google.com (mail-ot1-x331.google.com
 [IPv6:2607:f8b0:4864:20::331])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id AAF6CF8016E
	for <alsa-devel@alsa-project.org>; Wed, 14 Feb 2024 20:28:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AAF6CF8016E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=marliere.net header.i=@marliere.net header.a=rsa-sha256
 header.s=2024 header.b=SCw6gFnF
Received: by mail-ot1-x331.google.com with SMTP id
 46e09a7af769-6e2e6bcc115so29537a34.3
        for <alsa-devel@alsa-project.org>;
 Wed, 14 Feb 2024 11:28:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707938879; x=1708543679;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:dkim-signature:from:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jf14ZoO/nmlBr52xH16f4QtzbmUF7I3TiNIRIuzv/38=;
        b=v+dMQ0qKuV6N3o6NM25Ug3+qX4aUw2Gnl85rczNhv/rFNvHYTiqv0lo1VQDBSWH8OT
         ADirzuMn68r0VRrNe4+PMpqTHAEGxxkGsGk7my1s200R4F8EBH+j2mZaU2Eonohun2U8
         mGvsZyeWHDZmKZrKhp/to/JH/0t2fsm40PZ/GemwmoeSGNbVKRavhuhPu6OmSV67xAxL
         +3ttSvjPiBlY9ih8SDjIDwXGJITIV+NFAe4Y/02lJ69J8aZhv4EPtDxWWbX67txk5/cV
         dp2SOPfXsHcDpDdOnR7wf+Pqtr0/L3TIJgOza/2ERVxtfB7zrsN3wmZBD9yeggvVpXmB
         cf5w==
X-Forwarded-Encrypted: i=1;
 AJvYcCVzLtJ8rB5TULCu4s7Y/moFEPxkjxYSHUx3lZQDhwHjwTa1vWQFNc+8BEv8pIvx1Uo9lKzlP2hIiBs5K7Iz/zP4UgYExazqqvBsUPo=
X-Gm-Message-State: AOJu0Yx9Zz3HjEtT4PhDyiEk2C6lTZ17GuPC3MY594F3eLwNAGK1OIEV
	WwLGb0q7+8NONhNTnvvGvBqkWoVU2QOi/Dn11osXuGbr4S1iqcW04CSflE/FfYRISg==
X-Google-Smtp-Source: 
 AGHT+IEAYhq6gDI+wfjGNpVE+rgP71R6IJWQwTaB4Pvado9bg6PRnPO8hd9fVaRstKBYiI5d1bhUkw==
X-Received: by 2002:a05:6358:7e94:b0:176:5a5e:4b7c with SMTP id
 o20-20020a0563587e9400b001765a5e4b7cmr4334094rwn.6.1707938878920;
        Wed, 14 Feb 2024 11:27:58 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCVR9u5eZkHuCGi5ouHd+f0g8NQQ4YHOm8cA1VMP51BbkhHt1JThb7MruHfBbp2jOqzY3XMlD5Np4SblYOAzR1eT/GlxGl27xiJBxkJ3DXV7BdB+CZa9jHyphsomO0b9enJZlVrQB3f0xpjnnXghR2Vfe+GzaoSW4vh6zSdbvGe80sbDUcgvZZKawa5fhWNiYy72gTdl+n7QfMmLZ9pxqjoXacya+Fk3ttY/sEZbWcGPZKtooyKgE0Go0IaZm/nsILUBsA==
Received: from mail.marliere.net ([24.199.118.162])
        by smtp.gmail.com with ESMTPSA id
 m20-20020a637d54000000b005dc4b562f6csm4610547pgn.3.2024.02.14.11.27.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Feb 2024 11:27:58 -0800 (PST)
From: "Ricardo B. Marliere" <ricardo@marliere.net>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marliere.net;
	s=2024; t=1707938877;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jf14ZoO/nmlBr52xH16f4QtzbmUF7I3TiNIRIuzv/38=;
	b=SCw6gFnFMVEuGi9m9kdpWg/G/byrUWhUoaJNVFytbqm08dkL3TNLUCrp5yeU4nk3kH6IKG
	Q2ajsm7fuEGflTqeD6hhPkKqh7otTX5jGTxYS07WwodUuT+emH9TWpwYHF5qqNXYscGk9I
	KFebSrYePXpv5MtXEMJgTv46KBz5NV7GSQpxE4aimnaIwfeCfvA9KAsLL52o9ZwRa2sply
	7FiOY/ZOkr/c2XDxShAFyyXxuEOw51xdbA9jaK3r1H7Eit5zCVM/BBfUi3bsGjsHE0/FPt
	pmidWrok5yRwV2yjYdL2zs+NncOuDqxvjBwlYfRXrkrrsw7lnF82t/zcRv9JCg==
Authentication-Results: ORIGINATING;
	auth=pass smtp.auth=ricardo@marliere.net smtp.mailfrom=ricardo@marliere.net
Date: Wed, 14 Feb 2024 16:28:28 -0300
Subject: [PATCH 1/2] ALSA: aoa: make soundbus_bus_type const
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240214-bus_cleanup-alsa-v1-1-8fedbb4afa94@marliere.net>
References: <20240214-bus_cleanup-alsa-v1-0-8fedbb4afa94@marliere.net>
In-Reply-To: <20240214-bus_cleanup-alsa-v1-0-8fedbb4afa94@marliere.net>
To: Johannes Berg <johannes@sipsolutions.net>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linuxppc-dev@lists.ozlabs.org, alsa-devel@alsa-project.org,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Ricardo B. Marliere" <ricardo@marliere.net>
X-Developer-Signature: v=1; a=openpgp-sha256; l=1105; i=ricardo@marliere.net;
 h=from:subject:message-id; bh=Xx9qKGdssRAp5mo/Ka75lHZUssh4sDREhVlfbYK5MNo=;
 b=owEBbQKS/ZANAwAKAckLinxjhlimAcsmYgBlzRRg2+8TMjUIfbvPUXenySoAjgJXgm7QBin3p
 RuofTG2WeqJAjMEAAEKAB0WIQQDCo6eQk7jwGVXh+HJC4p8Y4ZYpgUCZc0UYAAKCRDJC4p8Y4ZY
 piFQD/9ZfnDZxcp/IDe9X1ChNa7pjG9eIbYI5mUhOc0Zc6KRmLJ9g7A4IYS+kCOLoFsvVlBkE7t
 6iVQCjTvPi84Kn1tqqV7xnD1SqT3wHWIcLgsTmnYzAZm84HBMeawypWsRFlPgKtosS2aF0TEUz5
 9T+aA3whcNkEru0JDutdtJ9OVwSC0FjnzTbu7xn7UT6yEk52bo9wXKP8P9jpHfABQMwpjHHxr7e
 5bePOHNZ60MbjJZjbLYWANuprwfb77QuFkz+707XTvT00f2dj/WU9/kio0JCXwHge5ByskhQnuy
 NubuAsnmWCzutX4VZFIQoik2lTr5uGIjGFKIfS5NDmgFh7bN1hnyHqUoyo6yoDW/NwkB04lu7p2
 BIB1/EVZSLaj7YXXEoJ+UGEsjahRsI9s1Pz5AqL4JpHX/9JxVQkjUMDlp40MecUDkQA8iG/8oHc
 C/LXnxkomcncgrlQ67GVWTpjOG7v2V2QbYQIA+sz/RriOA6Gn65JZ2CXGLRM36xkK2co36/vZ1Y
 i2lzXIiLtC17GZPcaVd7pxBPwNI4jeNKcRdZ5oReR49HGo/Urq/HI1hHn5mUojaQTnYlrO5NKQA
 0EyWfXjPdN5BVaHaHip4HeiZoP+6CyDDy1L2AGTH4qS+cFaVVh7DS1Cnfv2u4FOYCpXW0W8EXn+
 0h2JDPc+V71skoQ==
X-Developer-Key: i=ricardo@marliere.net; a=openpgp;
 fpr=030A8E9E424EE3C0655787E1C90B8A7C638658A6
X-MailFrom: rbmarliere@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: ASN3Q63CBO56I4KJUFSG3MAGQJQWJFAM
X-Message-ID-Hash: ASN3Q63CBO56I4KJUFSG3MAGQJQWJFAM
X-Mailman-Approved-At: Tue, 20 Feb 2024 07:59:38 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: <>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Since commit d492cc2573a0 ("driver core: device.h: make struct
bus_type a const *"), the driver core can properly handle constant
struct bus_type, move the soundbus_bus_type variable to be a constant
structure as well, placing it into read-only memory which can not be
modified at runtime.

Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Suggested-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Ricardo B. Marliere <ricardo@marliere.net>
---
 sound/aoa/soundbus/core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/aoa/soundbus/core.c b/sound/aoa/soundbus/core.c
index 8f24a3eea16b..2a295f610594 100644
--- a/sound/aoa/soundbus/core.c
+++ b/sound/aoa/soundbus/core.c
@@ -127,7 +127,7 @@ static void soundbus_device_shutdown(struct device *dev)
 
 /* soundbus_dev_attrs is declared in sysfs.c */
 ATTRIBUTE_GROUPS(soundbus_dev);
-static struct bus_type soundbus_bus_type = {
+static const struct bus_type soundbus_bus_type = {
 	.name		= "aoa-soundbus",
 	.probe		= soundbus_probe,
 	.uevent		= soundbus_uevent,

-- 
2.43.0

