Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E4D06EDA3A
	for <lists+alsa-devel@lfdr.de>; Tue, 25 Apr 2023 04:24:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 082D41022;
	Tue, 25 Apr 2023 04:23:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 082D41022
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1682389476;
	bh=Jyi1/JV5McqXGHI9E3S4DmkDYWfkrqZ0q1lria9OWQ0=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=eI62n9tqFin/dhj8RsWF6eQyOq5BP6qdXRDDhPO5Pn7Mud4XQuHsRf5FJc3Kt0TU6
	 SCBAswXNA5ROt/3gfo7oIABjd3Zc9EWMeTzTTY5z76eAPOC9IsEA5hyua+GVME+Bio
	 AWYXLVeWYgJVz/57YqDBBRiDM6/5bH1IpT8RzqdU=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7FAE1F8018A;
	Tue, 25 Apr 2023 04:23:45 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EEF70F80236; Tue, 25 Apr 2023 04:23:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi242170.contaboserver.net
 [207.180.221.201])
	by alsa1.perex.cz (Postfix) with ESMTP id 4FB59F800F8
	for <alsa-devel@alsa-project.org>; Tue, 25 Apr 2023 04:23:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4FB59F800F8
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1682389414848679781-webhooks-bot@alsa-project.org>
References: <1682389414848679781-webhooks-bot@alsa-project.org>
Subject: Fix gigabyte z690i aorus ultra ALC-4080
Message-Id: <20230425022340.EEF70F80236@alsa1.perex.cz>
Date: Tue, 25 Apr 2023 04:23:40 +0200 (CEST)
Message-ID-Hash: AXH56NSJLUPH2MJZJS2SGO6P73BPZZDZ
X-Message-ID-Hash: AXH56NSJLUPH2MJZJS2SGO6P73BPZZDZ
X-MailFrom: github@alsa-project.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/AXH56NSJLUPH2MJZJS2SGO6P73BPZZDZ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-ucm-conf pull request #307 was opened from jameson-reed:

Currently the board is not matched by the regex.
Once matched the config still isn't valid.
I've got it stable with the following changes, disabling spdif and line1 and updating Mic1PCM value.

The front headphone and microphone jacks are working now, as is the rear audio out. That does leave 1 jack on the back I haven't had any luck with.

There is no spdif on the board.

Request URL   : https://github.com/alsa-project/alsa-ucm-conf/pull/307
Patch URL     : https://github.com/alsa-project/alsa-ucm-conf/pull/307.patch
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
