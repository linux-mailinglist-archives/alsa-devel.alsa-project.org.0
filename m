Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B8D4469983C
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Feb 2023 16:02:32 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 231D4EBD;
	Thu, 16 Feb 2023 16:01:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 231D4EBD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1676559752;
	bh=SMinHYA3AWsJ3IE65LQNElArEmy7Nk2NKKr6XR5Djcs=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=QUeYYaMfHyoxHzk87Ekwi/uPVxyf33fhiDqveYUj85ZNO6ZCrM3sMYaBti+JWciYG
	 SbreW6I0GJMyDequ9OdyeyQou4DDEOeGAIiFhMJXwGTy9T94AfdDCKJ6PRRMUcK08V
	 ceYLLD9VlMZfEpO4ChkbI66P5e9AYjSQmhiiFvoU=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id AE99DF80605;
	Thu, 16 Feb 2023 15:56:05 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AF869F800E4; Fri, 10 Feb 2023 05:51:22 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com
 [IPv6:2607:f8b0:4864:20::431])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 66933F800B8
	for <alsa-devel@alsa-project.org>; Fri, 10 Feb 2023 05:51:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 66933F800B8
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=jeRCbikd
Received: by mail-pf1-x431.google.com with SMTP id y4so2765293pfe.4
        for <alsa-devel@alsa-project.org>;
 Thu, 09 Feb 2023 20:51:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y5Ha95DZYK/aP/j52BgmRVv3D+Ht1XBi+RBwbRpPJAA=;
        b=jeRCbikd0l+NYcX61eSocwQ1WUxxnAWy9jXktGeo2f1Ks/WWMN6X5HONHK7QeGRFVt
         iOUduMbJJxxI+2VxjAve5WkgVa4Z8HQaJBB2RcPWhn9YEPeT1sC2wS0FJVXrcYX9rxuA
         Tn6jmBhZ2gZC8wfNCWtA8AtXpd5hbTGVhN/DYmqHGTf0a4gt1sTPPQUBMAzsmYB0YX+I
         d8Ee/B6UJqkuoQgF6ommsJa/FZIrubLdFKhd1po/LM+Zq0QPNY35bBSY9MRxn9TiBdWW
         TaE0Dw6cX55x7gagXpw485WSPfiwCzg6t2bL883xOej+5KbppjICobrr2oOeAvOAbz6C
         exQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y5Ha95DZYK/aP/j52BgmRVv3D+Ht1XBi+RBwbRpPJAA=;
        b=b9Cz/KFaKsIYgTcs8esGvmUdKp5pIpf6PeMc45YtCETwWelq9QGQhGj1JXTE86x0jI
         cP5Zal995+hXX8kacvBCQeBnfZs/l8gm1Unffh0ti/3ieTE1IU9rGaMFT4vyBaBPc2uF
         QxG80lOYQQ1AUDG003IDFm6RZJQtKhIG+h5NuYw5PxqDbOB1UUyMb4LZMKoHXuBeS9TX
         YERUmy7QAyR6niS6seDgwW9qlpiTRTGHLIIIoL7/KcrBEpHtfD6h2pB67Mf4CVZ6GJRY
         2n7EeBTM8JI/ffGZhkoQLs/8R1Y7WybXgJGevShWfIjntFRLxD3IEsrFrdfBB32Dfbn3
         fk9Q==
X-Gm-Message-State: AO0yUKWfN/LDzsIoabnKStOvABNVbV+knuU9hy5G0O1yFhZbRuDh7Fdj
	Hu2Xm0QhY2aym3++16k64Oc=
X-Google-Smtp-Source: 
 AK7set8TZvXWIyGcQ3NgifffV8KYbOTEXt34sxsX5/J/r2MfeRhwM5bCgQOPxLHbQqGiay9vdFRZTg==
X-Received: by 2002:a62:6d85:0:b0:590:7616:41eb with SMTP id
 i127-20020a626d85000000b00590761641ebmr10365952pfc.30.1676004676892;
        Thu, 09 Feb 2023 20:51:16 -0800 (PST)
Received: from localhost.localdomain ([202.53.32.211])
        by smtp.gmail.com with ESMTPSA id
 t13-20020a62ea0d000000b0057fec210d33sm2269218pfh.152.2023.02.09.20.51.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Feb 2023 20:51:16 -0800 (PST)
From: Orlando Chamberlain <orlandoch.dev@gmail.com>
To: platform-driver-x86@vger.kernel.org,
	amd-gfx@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	alsa-devel@alsa-project.org
Subject: [RFC PATCH 8/9] hda/hdmi: Register with vga_switcheroo on Dual GPU
 Macbooks
Date: Fri, 10 Feb 2023 15:48:25 +1100
Message-Id: <20230210044826.9834-9-orlandoch.dev@gmail.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230210044826.9834-1-orlandoch.dev@gmail.com>
References: <20230210044826.9834-1-orlandoch.dev@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: orlandoch.dev@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: EWCRBZQOEMQYP7TTFWNPT5COOCPFDSHA
X-Message-ID-Hash: EWCRBZQOEMQYP7TTFWNPT5COOCPFDSHA
X-Mailman-Approved-At: Thu, 16 Feb 2023 14:55:48 +0000
CC: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Hans de Goede <hdegoede@redhat.com>,
 Mark Gross <markgross@kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>,
 Andrey Grodzovsky <andrey.grodzovsky@amd.com>,
 Lijo Lazar <lijo.lazar@amd.com>, YiPeng Chai <YiPeng.Chai@amd.com>,
 Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>,
 Mario Limonciello <mario.limonciello@amd.com>,
 Bokun Zhang <Bokun.Zhang@amd.com>, Jack Xiao <Jack.Xiao@amd.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Rander Wang <rander.wang@intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>, Yong Zhi <yong.zhi@intel.com>,
 Evan Quan <evan.quan@amd.com>, Kerem Karabay <kekrby@gmail.com>,
 Aditya Garg <gargaditya08@live.com>, Aun-Ali Zaidi <admin@kodeit.net>,
 Orlando Chamberlain <orlandoch.dev@gmail.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/EWCRBZQOEMQYP7TTFWNPT5COOCPFDSHA/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Commit 586bc4aab878 ("ALSA: hda/hdmi - fix vgaswitcheroo detection for
AMD") caused only AMD gpu's with PX to have their audio component register
with vga_switcheroo. This meant that Apple Macbooks with apple-gmux as the
gpu switcher no longer had the audio client registering, so when the gpu is
powered off by vga_switcheroo snd_hda_intel is unaware that it should have
suspended the device:

amdgpu: switched off
snd_hda_intel 0000:03:00.1:
    Unable to change power state from D3hot to D0, device inaccessible
snd_hda_intel 0000:03:00.1: CORB reset timeout#2, CORBRP = 65535

Simialar to ATPX, we use the presence of an acpi method (PWRD in this
case) to ensure we only register with the correct devices.

Fixes: 586bc4aab878 ("ALSA: hda/hdmi - fix vgaswitcheroo detection for AMD")
Signed-off-by: Orlando Chamberlain <orlandoch.dev@gmail.com>
---
 sound/pci/hda/hda_intel.c | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/sound/pci/hda/hda_intel.c b/sound/pci/hda/hda_intel.c
index 87002670c0c9..c97bbe60e603 100644
--- a/sound/pci/hda/hda_intel.c
+++ b/sound/pci/hda/hda_intel.c
@@ -1435,11 +1435,25 @@ static bool atpx_present(void)
 	}
 	return false;
 }
+
+static bool pwrd_present(struct pci_dev *pci)
+{
+	acpi_handle pwrd_handle;
+	acpi_status status;
+
+	status = acpi_get_handle(ACPI_HANDLE(&pci->dev), "PWRD", &pwrd_handle);
+	return ACPI_FAILURE(status) ? false : true;
+}
 #else
 static bool atpx_present(void)
 {
 	return false;
 }
+
+static bool pwrd_present(struct pci_dev *pci)
+{
+	return false;
+}
 #endif
 
 /*
@@ -1461,9 +1475,12 @@ static struct pci_dev *get_bound_vga(struct pci_dev *pci)
 				 * rather than the dGPU's namespace. However,
 				 * the dGPU is the one who is involved in
 				 * vgaswitcheroo.
+				 *
+				 * PWRD is in the dGPU's ACPI namespace on Apple
+				 * Macbooks with dual gpu's.
 				 */
 				if (((p->class >> 16) == PCI_BASE_CLASS_DISPLAY) &&
-				    atpx_present())
+						(atpx_present() || pwrd_present(p)))
 					return p;
 				pci_dev_put(p);
 			}
-- 
2.39.1

