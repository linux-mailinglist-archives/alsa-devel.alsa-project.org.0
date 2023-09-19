Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9901B7A60FE
	for <lists+alsa-devel@lfdr.de>; Tue, 19 Sep 2023 13:16:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E63B7DF1;
	Tue, 19 Sep 2023 13:15:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E63B7DF1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695122163;
	bh=Gm4r3/LagDtrBc0Pi3hc438lu8qlQyEh0YJDVE3ZG+0=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=Fa4slO+a4Hnu4kZXjRuC9EAtOZewjihbFs8sfurfNbMtiOh9ofuWn6wB+FIomsb+Y
	 4P8ZA0NhQ86em92BeGHp36LgXn2nGtijoJybZdXfwW6zbp4AwZgB/4hgLtRBIop5c7
	 j98qj2cdhA7XcPM4j4SqlFTQ7AqzDYFboCQmqoCg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AC72EF801F5; Tue, 19 Sep 2023 13:15:04 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E872DF80125;
	Tue, 19 Sep 2023 13:15:03 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1DE3BF8025A; Tue, 19 Sep 2023 13:14:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C6604F80125
	for <alsa-devel@alsa-project.org>; Tue, 19 Sep 2023 13:14:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C6604F80125
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Nwf5X5/y
Received: by mail.gandi.net (Postfix) with ESMTPSA id E81C16000B;
	Tue, 19 Sep 2023 11:14:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1695122092;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=wvi+vg8mpIZUTS1xeOe1ah/JL0hNaPgNAGULoID+yRY=;
	b=Nwf5X5/y80upgFklSy6B45U2b5g/2LeFc+LvJDoslQMsuLZimMNm/dN6CYrGx4uCr4bqcL
	vJhVF2u6acCqDo7bCmAjlN7HkEqkOCDcjvAnVKkzDxikapFVPio08h2k/QcB6FWjmP+5EP
	PMmhu9RY71SeMstQLUtpOXVQKs0xhMbWxeyMRjaXlzsJ9I3MtJgcRsaxA3dD4/11RgyRYT
	6mQ7KNPMuTinh/uW7VDkfe0u/GYDbD+A1UlV1aCwvl+ex/vr0Zk65wUrDDdjcFfmbRjk5l
	Wq7YGnKTeE545o8FUr+z3ULNTEUQbIISRrJJQptw9h8Owcv8lo7rLSipM7CI+A==
From: michael.opdenacker@bootlin.com
To: alsa-devel@alsa-project.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH 0/2] fixes for the musl C library
Date: Tue, 19 Sep 2023 13:14:28 +0200
Message-Id: <20230919111430.2912326-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
Message-ID-Hash: UXWLOJSJLKCZSJQXXPLC5CG4TGIQJSTG
X-Message-ID-Hash: UXWLOJSJLKCZSJQXXPLC5CG4TGIQJSTG
X-MailFrom: michael.opdenacker@bootlin.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UXWLOJSJLKCZSJQXXPLC5CG4TGIQJSTG/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

This is a series of patches to fix compiling alsa-utils
with the Musl C library.

Tests were made use the "master" branch of the Yocto Project
Poky distribution.

Compiling with the GNU C library (glibc) was tested too.

Michael Opdenacker (2):
  topology.c: include locale.h
  nhlt-dmic-info.c: include sys/types.h

 nhlt/nhlt-dmic-info.c | 1 +
 topology/topology.c   | 1 +
 2 files changed, 2 insertions(+)

-- 
2.34.1

