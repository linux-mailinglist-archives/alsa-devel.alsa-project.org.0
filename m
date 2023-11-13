Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D09B7E9B8B
	for <lists+alsa-devel@lfdr.de>; Mon, 13 Nov 2023 12:57:24 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 03B79DF5;
	Mon, 13 Nov 2023 12:56:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 03B79DF5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1699876644;
	bh=BtJxjRD9fIrWLjBWH1NClqhUxSq9z09/erGQKsITDqk=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=BAsUYyJEzeX72l7Rs5Mz+frD5fMviJFSkdFBWrZDbAd9XaGv387UbDsk+R6v8HO3X
	 UzmMdYopca+DYQnAH/2tnZ10MYd0kVIeW0ZkmOrkmQRXRjujcOM65XIatfUlKTwoiF
	 ch/pIAzgy4NTGTs7UGLAYC312sWMMiYhwqUjzYJQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 795D4F805BB; Mon, 13 Nov 2023 12:54:59 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E0CE1F805BA;
	Mon, 13 Nov 2023 12:54:58 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8FD07F802E8; Mon, 13 Nov 2023 11:22:15 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No,
 score=-4.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 25DD8F80093
	for <alsa-devel@alsa-project.org>; Mon, 13 Nov 2023 11:22:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 25DD8F80093
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id B8F39B80927;
	Mon, 13 Nov 2023 10:22:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40302C433C8;
	Mon, 13 Nov 2023 10:22:07 +0000 (UTC)
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
To: linux-media@vger.kernel.org
Cc: Shengjiu Wang <shengjiu.wang@nxp.com>,
	alsa-devel@alsa-project.org
Subject: [RFC PATCH 0/8] v4l-utils: add v4l-audioX support
Date: Mon, 13 Nov 2023 11:18:41 +0100
Message-ID: <20231113102202.258725-1-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: SRS0=a+Jp=G2=xs4all.nl=hverkuil-cisco@kernel.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: XN2CMY7CKBI6DF4AGTPSLFFJEAP2SV67
X-Message-ID-Hash: XN2CMY7CKBI6DF4AGTPSLFFJEAP2SV67
X-Mailman-Approved-At: Mon, 13 Nov 2023 11:54:41 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XN2CMY7CKBI6DF4AGTPSLFFJEAP2SV67/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

This patch series adds support for v4l-audioX M2M devices.

It is an initial version and it needs a bit more work. Mainly adding
support for the new V4L2_CTRL_TYPE_FIXED_POINT, but that requires
some more work in the driver patch series.

At least this series will get the basic support in place and adds
a vim2m-audio test to the test-media regression test script.

Regards,

	Hans


