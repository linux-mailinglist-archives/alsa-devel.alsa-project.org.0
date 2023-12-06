Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A98F807363
	for <lists+alsa-devel@lfdr.de>; Wed,  6 Dec 2023 16:09:17 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 610A21CF;
	Wed,  6 Dec 2023 16:09:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 610A21CF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1701875356;
	bh=KqCudYl3/I3txNCx1XUEcUYlpLbj8ZSPTiuyxOHwF0c=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=n1ho5a1wLcdQIXJnOMGLS0eGlsIQQcsVSbIz0XhXLL+yDfkMI/Z9ji21FbE8KPjFi
	 IJ/MnHu+KMSXIdvRNXzrrkplM7rVm8Wb48YlLJCLbeUROfg7sNmKH1bR/lcEd8ASX5
	 Pzl4R7buZ3AhovnrIfFkuJgY9cSU2Mo3ALE9waKk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0C413F8025F; Wed,  6 Dec 2023 16:08:44 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id ABB09F80571;
	Wed,  6 Dec 2023 16:08:44 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EB0EFF8024E; Wed,  6 Dec 2023 16:08:39 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi242170.contaboserver.net
 [207.180.221.201])
	by alsa1.perex.cz (Postfix) with ESMTP id 702E5F800AC
	for <alsa-devel@alsa-project.org>; Wed,  6 Dec 2023 16:08:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 702E5F800AC
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1701875316957022429-webhooks-bot@alsa-project.org>
References: <1701875316957022429-webhooks-bot@alsa-project.org>
Subject: default pcm plugin
Message-Id: <20231206150839.EB0EFF8024E@alsa1.perex.cz>
Date: Wed,  6 Dec 2023 16:08:39 +0100 (CET)
Message-ID-Hash: HIKHCBIQU5ONMEYQJIWI74AN6ZK6H764
X-Message-ID-Hash: HIKHCBIQU5ONMEYQJIWI74AN6ZK6H764
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HIKHCBIQU5ONMEYQJIWI74AN6ZK6H764/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-lib issue #371 was opened from sylware:

Is there a robust programming way to know if the canonical "default" pcm is actually a pipewire/pulseaudio/jack plugin? That at a device/pcm enumeration time, namely before any pcm is actually being configured.

I was thinking about the "configuration" API, but I am not that sure it "resolves" everything including user-specific/system-specific configurations (asound rc files and env variables).

Issue URL     : https://github.com/alsa-project/alsa-lib/issues/371
Repository URL: https://github.com/alsa-project/alsa-lib
