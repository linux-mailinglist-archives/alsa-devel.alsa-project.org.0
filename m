Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 929437EC385
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Nov 2023 14:22:29 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9EB0774C;
	Wed, 15 Nov 2023 14:21:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9EB0774C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1700054548;
	bh=a2Uu8UI8V0vvRA3hscoyzszAisM9xQQnRCyxHTEGNwM=;
	h=Subject:From:To:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:Date:From;
	b=MWfQqq2D4QsGNC+M+t20UK7WdAgHMs29jq9o2hSL/XqYSOmp2dlbO8F1IYY/EhT7V
	 DvxSVJdriRMRIYMOETtrNvtSWY2P5qGuNVHgk6XZjKXxYHByQwgjkvw+ZOLhqLdMH8
	 hLU89tIyFJ891TZYkiy6rjflgRJzkaryB/CenL4U=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D7A69F80166; Wed, 15 Nov 2023 14:21:37 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 92D5AF8016E;
	Wed, 15 Nov 2023 14:21:37 +0100 (CET)
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Subject: [PATCH] ALSA: hda: i915: Alays handle -EPROBE_DEFER
From: maarten.lankhorst@linux.intel.com
To: alsa-devel@alsa-project.org
Message-ID: <20231115123625.74286-1-maarten.lankhorst@linux.intel.com>
X-Mailman-Approved-At: Wed, 15 Nov 2023 13:21:33 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/SL5F25YFLEQSDFUY3WUSOV7KC5ZPTL7R/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>
Date: Wed, 15 Nov 2023 14:21:37 +0100 (CET)

The content of this message was lost. It was probably cross-posted to
multiple lists and previously handled on another list.
