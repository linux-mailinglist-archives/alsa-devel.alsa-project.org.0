Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EC81AC1883D
	for <lists+alsa-devel@lfdr.de>; Wed, 29 Oct 2025 07:49:09 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E638C601CC;
	Wed, 29 Oct 2025 07:48:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E638C601CC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1761720548;
	bh=ZEYIeMKiQhXCZtlZDF9DQpZAavgkjoP4Y1/DfINePIs=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=HPONdC4h9M33Tc98QKv6pju/UxIfebxCkM56Fcs9uY11meQaMf75epA/pXM703ivl
	 piRho8ZwPjuXgqz3zNR01w/p+tzrWB8bkpGff9pEYw6penvhZq6hyL9JIaQR5VmU3i
	 xOmSpnydEcxBDzQ0AZGAtjsmGgofl+qmXW9k9bis=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4486BF805C7; Wed, 29 Oct 2025 07:48:33 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D0112F8053D;
	Wed, 29 Oct 2025 07:48:32 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DD4C5F80423; Wed, 29 Oct 2025 07:48:26 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=BAYES_00,KHOP_HELO_FCRDNS,
	MISSING_DATE,T_SPF_HELO_TEMPERROR,T_SPF_TEMPERROR shortcircuit=no
	autolearn=no autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi2259423.contaboserver.net
 [45.14.194.44])
	by alsa1.perex.cz (Postfix) with ESMTP id 40CC2F80071
	for <alsa-devel@alsa-project.org>; Wed, 29 Oct 2025 07:48:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 40CC2F80071
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - edited <github@alsa-project.org>
To: alsa-devel@alsa-project.org
Message-Id: <1872e37717db6e00-webhooks-bot@alsa-project.org>
In-Reply-To: <alsa-project/alsa-ucm-conf/pr/631@alsa-project.org>
References: <alsa-project/alsa-ucm-conf/pr/631@alsa-project.org>
Subject: Qualcomm: qcs616: Add TALOS EVK HiFi config
Date: Wed, 29 Oct 2025 07:48:26 +0100 (CET)
Message-ID-Hash: CVKJZIEHVMLXUS63MSN7L7GRLER53CVY
X-Message-ID-Hash: CVKJZIEHVMLXUS63MSN7L7GRLER53CVY
X-MailFrom: github@alsa-project.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/CVKJZIEHVMLXUS63MSN7L7GRLER53CVY/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-ucm-conf pull request #631 was edited from mohsRafi:

Add UCM2 configs for the Qualcomm TALOS-EVK Board.

Request URL   : https://github.com/alsa-project/alsa-ucm-conf/pull/631
Patch URL     : https://github.com/alsa-project/alsa-ucm-conf/pull/631.patch
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
