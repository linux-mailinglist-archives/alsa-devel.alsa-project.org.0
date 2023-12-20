Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 45808822167
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Jan 2024 19:52:26 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7B03DE79;
	Tue,  2 Jan 2024 19:52:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7B03DE79
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1704221545;
	bh=VesXTj3mWNVUP7U8g+o6LTFl3Kly/nReqz1itVkqGeI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=EnvwQZFNM1jBRulDSedqCaU3k5hpnikfk35sJ2MWM8Jc2mz2k1hkeQd1JHpMAtPpK
	 oFSwktTqd6guvSXwFJbtafzvTrBgPeYawfIxnBB81Jqr6oW+UEHVmN5YtwDjnOosZg
	 RficffaLmfXr7noJB1CedN0hP/LPkbBTpPn9lmns=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 14136F805ED; Tue,  2 Jan 2024 19:50:55 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DE458F8067A;
	Tue,  2 Jan 2024 19:50:54 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F0F5DF804DA; Wed, 20 Dec 2023 08:38:28 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id EDA84F80212
	for <alsa-devel@alsa-project.org>; Wed, 20 Dec 2023 08:38:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EDA84F80212
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=fTkhhtQz
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-50e3901c2e2so3788138e87.0
        for <alsa-devel@alsa-project.org>;
 Tue, 19 Dec 2023 23:38:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703057891; x=1703662691;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xVVt1fDDGnFJy0Xc9rDOy5tQYcz5E1cw4wOb1DmAjF4=;
        b=fTkhhtQzZ0RJfXg0XFnWKvXGmVDKoJWz9SpdMYEdimXEsoubTucW5ri3eYGiPo8JAX
         +ifREVpIRHLTMhhSgID9sFAVqfr85BSn9eDTLBBhw2Le6bvAw+fie3A7Jn5OEE/E9Rym
         oRbvRWN4sNWXQ0VWzODXSdrK0inU/m94aesIwExz6vfnlXe5jE1Dt+bTDQAWnmksdD79
         M+xeN7gQG6/+8Ka0R2rHh1RzT4b/C5PM9Wl7wKbABr1CZ7M7ky3VKlt3SuPiWDV2QqrM
         6zvjhhPH7gMPgTdLtZdInrpHpoO6K/tgvPWE51wjxBiruf0oqvxR9STZpuM8a6O35CE/
         q4FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703057891; x=1703662691;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xVVt1fDDGnFJy0Xc9rDOy5tQYcz5E1cw4wOb1DmAjF4=;
        b=j5LFAYUiFaIHdKMnvyoM9qs5SjW/e/t7Mae+bJpmO2Y8mZgKprpumLMb5r7yEiSzd1
         oCLQo2n+F4zGTVo41WoKXfNvunWhRJ52ToRMBWPf2XXxZ5wtNs7rpZYRH9OuOYvK7VcE
         50yE7+5ir6LfOWVuY0RydDp3PN3o6nIoPUC2VWH2sZBE/YphmSWkM8mZUD9ajfozVuPE
         XJZ20y1DzCr9xasLHHMKZxzJGIIcr2z/cu+b6S0ISu26/hxqERjoPOTZtUwxxXysXvJo
         R/ciNCkosH3IoYmWF9EdeddpTOuRBW/PETCmc3LnLCWHPiUq7vYGoNR/VL5BrEDIeTr/
         WmKg==
X-Gm-Message-State: AOJu0YyVgW5UZGkh4USEzjntj4DjBXHnZFg5fEdUqmAz9s494fQr5bii
	noOK340XnuMxUD2NNkFV0w==
X-Google-Smtp-Source: 
 AGHT+IEFNKchB/1VHfNCRdiLGugNJGY2vX/742FVk8651mUTqZdoki5LBFSkYfc8gB1q1yTBurwMCA==
X-Received: by 2002:a05:6512:2098:b0:50e:30f1:8668 with SMTP id
 t24-20020a056512209800b0050e30f18668mr2461045lfr.56.1703057890779;
        Tue, 19 Dec 2023 23:38:10 -0800 (PST)
Received: from alex-pc-ubuntu.lan (31-10-153-16.cgn.dynamic.upc.ch.
 [31.10.153.16])
        by smtp.gmail.com with ESMTPSA id
 p7-20020a056402500700b0055283720ec3sm5979043eda.76.2023.12.19.23.38.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Dec 2023 23:38:10 -0800 (PST)
From: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
To: tiwai@suse.de
Cc: alex.vinarskis@gmail.com,
	alsa-devel@alsa-project.org,
	david.rhodes@cirrus.com,
	james.schulman@cirrus.com,
	josbeir@gmail.com,
	linux-kernel@vger.kernel.org,
	patches@opensource.cirrus.com,
	perex@perex.cz,
	sbinding@opensource.cirrus.com,
	stuarth@opensource.cirrus.com,
	tiwai@suse.com
Subject: [PATCH v2 0/2] ALSA: hda: cs35l41: Support Dell XPS 9530 (2023)
Date: Wed, 20 Dec 2023 08:38:07 +0100
Message-Id: <20231220073809.22027-1-alex.vinarskis@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <87ttokpyws.wl-tiwai@suse.de>
References: <87ttokpyws.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: alex.vinarskis@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: BJMRCJNQE7SQ62NIIYX4XE7U75M5OPRI
X-Message-ID-Hash: BJMRCJNQE7SQ62NIIYX4XE7U75M5OPRI
X-Mailman-Approved-At: Mon, 01 Jan 2024 13:16:44 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BJMRCJNQE7SQ62NIIYX4XE7U75M5OPRI/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Following changes by Cirrus, attaching rebased (and greatly simplified)
patch to support Dell XPS 9530 (2023) laptop.

Safety-guard against capped SPI speed is added via separate patch. It is
not conditioned to particular subsystem, as all devices normally should
pass this check. Following suggestion by Stuart Henderson, error out
threshold is lowered to 1/2 of requested rate.

Aleksandrs Vinarskis (2):
  ALSA: hda: cs35l41: Safety-guard against capped SPI speed
  ALSA: hda: cs35l41: Support Dell XPS 9530 (2023)

 sound/pci/hda/cs35l41_hda_property.c | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

-- 
2.40.1

