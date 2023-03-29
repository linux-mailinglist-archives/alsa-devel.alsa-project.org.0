Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EC366CD126
	for <lists+alsa-devel@lfdr.de>; Wed, 29 Mar 2023 06:18:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 59C3D1E9;
	Wed, 29 Mar 2023 06:17:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 59C3D1E9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1680063499;
	bh=6J2AMSxyqJqSCBnQXD+1/lgGRiBRFekfrDG9F9EZ9wE=;
	h=To:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From:Reply-To:Cc:From;
	b=jpy04H9ZUoqpNN0CajDDv5zpY+p5yEXJsJQbZIUgrRJPZOOz2Aq5RH6Rz+z/KLFtJ
	 FJ5oOc3b7+MNifQDTkUmRprERA52Uhq1b/HC//3L4PXVONCNz9H8FzyGCLjZH3KZIC
	 71Dn9Z2xx8SCXKSODzDPzJfvbubeZ6ZusSdEHPM8=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 00447F80549;
	Wed, 29 Mar 2023 06:16:05 +0200 (CEST)
To: alsa-devel@alsa-project.org
Subject: [PATCH 0/4] ALSA: ymfpci: PM related cleanups and fixes
Date: Wed, 29 Mar 2023 07:14:36 +0300
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/CAGC2MNSLKIJI5RKRJUMY7V3NTAPVIDI/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>
MIME-Version: 1.0
Message-ID: 
 <168006336536.26.17903812329530006488@mailman-core.alsa-project.org>
From: Tasos Sahanidis via Alsa-devel <alsa-devel@alsa-project.org>
Reply-To: Tasos Sahanidis <tasos@tasossah.com>
Cc: tiwai@suse.com, tasos@tasossah.com
Content-Type: message/rfc822
Content-Disposition: inline

Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 01D6FF80527; Wed, 29 Mar 2023 06:15:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from devnull.tasossah.com (devnull.tasossah.com
 [IPv6:2001:41d0:1:e60e::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 788A5F8032D
	for <alsa-devel@alsa-project.org>; Wed, 29 Mar 2023 06:15:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 788A5F8032D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=devnull.tasossah.com header.i=@devnull.tasossah.com
 header.a=rsa-sha256 header.s=vps header.b=UM/61m07
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=devnull.tasossah.com; s=vps; h=Content-Transfer-Encoding:MIME-Version:
	Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=RZPeNaV/cRSpfgZRAJg7ZlwfgkTQ1jCj8EiJ45Iz5CE=; b=UM/61m07xuhaYdH/Ui4yRJ+6Bm
	AHFNBvCAUpbNtnkX8bZxzymR06iWLCUUoftk+Alk8JTHXvjfSKKXS0YMW6WfGhCsnxhFLTf6L9E88
	XWGZpw513aUTOsYiKfaP14bKq2TPW78ldFpuu3u9RJTdtFNEd4ibp+9OUxl3Lhv/YL7E=;
Received: from [2a02:587:6a11:9400::d54] (helo=localhost.localdomain)
	by devnull.tasossah.com with esmtpsa  (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <tasos@tasossah.com>)
	id 1phNDK-00GucY-Ue; Wed, 29 Mar 2023 07:15:11 +0300
From: Tasos Sahanidis <tasos@tasossah.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 0/4] ALSA: ymfpci: PM related cleanups and fixes
Date: Wed, 29 Mar 2023 07:14:36 +0300
Message-Id: <20230329041440.177363-1-tasos@tasossah.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: CAGC2MNSLKIJI5RKRJUMY7V3NTAPVIDI
X-Message-ID-Hash: CAGC2MNSLKIJI5RKRJUMY7V3NTAPVIDI
X-MailFrom: tasos@tasossah.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: tiwai@suse.com, tasos@tasossah.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/CAGC2MNSLKIJI5RKRJUMY7V3NTAPVIDI/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi,

This series started while attempting to fix the OPL not being detected
after restoring from S4 on a YMF744. While attempting to debug the issue,
it was found that SIMPLE_DEV_PM_OPS was deprecated, and thus replaced,
and a few cleanups were made along the way.

Tasos Sahanidis (4):
  ALSA: ymfpci: Switch to DEFINE_SIMPLE_DEV_PM_OPS()
  ALSA: ymfpci: Move allocation of saved registers to struct snd_ymfpci
  ALSA: ymfpci: Store saved legacy registers in an array
  ALSA: ymfpci: Store additional legacy registers on suspend

 sound/pci/ymfpci/ymfpci.c      |  4 +-
 sound/pci/ymfpci/ymfpci.h      | 50 +++++++++++++++++++++---
 sound/pci/ymfpci/ymfpci_main.c | 70 ++++++++++------------------------
 3 files changed, 66 insertions(+), 58 deletions(-)

-- 
2.25.1
