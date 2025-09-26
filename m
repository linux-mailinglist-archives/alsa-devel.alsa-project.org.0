Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 05B89BA4BD9
	for <lists+alsa-devel@lfdr.de>; Fri, 26 Sep 2025 19:09:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7DB2A601E4;
	Fri, 26 Sep 2025 19:09:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7DB2A601E4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1758906565;
	bh=nBp1IWa68UI9aC+ASimj/FQvjndz6+vXgSoSrHzylUY=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=XAb5TqpxyB+k1HgQINkUAf0rMhPZVOpsWz1EHBgsT4DDvVDtEoXfI6WAsUlplWVpt
	 gLBhn2igJevJRXbMphFenRcn3K0Y1AK6dGJxw5rz3iGUECUXAonzTnZBCTUMK97ShZ
	 C3TS/D1D86jEKJ8QYscaEDAHo6tD4BBNUqNUAtLk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 896F6F805C4; Fri, 26 Sep 2025 19:08:52 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 561A2F805C5;
	Fri, 26 Sep 2025 19:08:52 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 53087F804FC; Fri, 26 Sep 2025 19:08:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=5.0 tests=BAYES_00,MISSING_DATE,
	RCVD_IN_DNSWL_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_NONE,SPF_PASS shortcircuit=no
	autolearn=no autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi2259423.contaboserver.net
 [45.14.194.44])
	by alsa1.perex.cz (Postfix) with ESMTP id E23DEF8011B
	for <alsa-devel@alsa-project.org>; Fri, 26 Sep 2025 19:08:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E23DEF8011B
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
Message-Id: <1868e429c6911d00-webhooks-bot@alsa-project.org>
In-Reply-To: <alsa-project/alsa-ucm-conf/pr/618@alsa-project.org>
References: <alsa-project/alsa-ucm-conf/pr/618@alsa-project.org>
Subject: ucm2: Qualcomm: sa8775p: Move lemans-evk HiFi to sa8775p subdir
Date: Fri, 26 Sep 2025 19:08:46 +0200 (CEST)
Message-ID-Hash: NVP275KWTTFHPUU4GGK2RDVCUPS56GGE
X-Message-ID-Hash: NVP275KWTTFHPUU4GGK2RDVCUPS56GGE
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/NVP275KWTTFHPUU4GGK2RDVCUPS56GGE/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-ucm-conf pull request #618 was opened from mohsRafi:

Move lemans-evk HiFi configuration files to the sa8775p subdirectory, aligning with the kernel's use of the sa8775p folder for all Linux firmware. So Update the UCM HiFi configuration file accordingly.

Request URL   : https://github.com/alsa-project/alsa-ucm-conf/pull/618
Patch URL     : https://github.com/alsa-project/alsa-ucm-conf/pull/618.patch
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
