Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 92CFF75098E
	for <lists+alsa-devel@lfdr.de>; Wed, 12 Jul 2023 15:26:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 70942206;
	Wed, 12 Jul 2023 15:25:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 70942206
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689168405;
	bh=xqQINfo99SfX8A2v+elbxn62fhSORm4PQ4GJ/8oF95g=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=Re1IoZCZPOTF4sM5tp8gHFrpQPT238ANOIs7vOhne8pQrItlWB+CkOXzb6o1WJfuY
	 lsPEQcBVWXDVNRT/htxy+W5qftnJ4kXufZYO8Xs30j/RRmKMmn5Noytp4VLP3TTd/N
	 qq+xzg2zzHthAeMlD6UFgTW3wEW5LAOkfFAKJx9U=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E1C71F80535; Wed, 12 Jul 2023 15:25:54 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8BB81F80093;
	Wed, 12 Jul 2023 15:25:54 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C7FFDF80249; Wed, 12 Jul 2023 15:25:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi242170.contaboserver.net
 [207.180.221.201])
	by alsa1.perex.cz (Postfix) with ESMTP id 28C80F80093
	for <alsa-devel@alsa-project.org>; Wed, 12 Jul 2023 15:25:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 28C80F80093
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - edited <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1689168343997067213-webhooks-bot@alsa-project.org>
References: <1689168343997067213-webhooks-bot@alsa-project.org>
Subject: ALC4082 - ASRock Z790 PG-ITX/TB4
Message-Id: <20230712132550.C7FFDF80249@alsa1.perex.cz>
Date: Wed, 12 Jul 2023 15:25:50 +0200 (CEST)
Message-ID-Hash: 4VPDFIUDWJ6MFR4HUJQ66LQQFQB4G4XP
X-Message-ID-Hash: 4VPDFIUDWJ6MFR4HUJQ66LQQFQB4G4XP
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4VPDFIUDWJ6MFR4HUJQ66LQQFQB4G4XP/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-ucm-conf issue #334 was edited from Shmob1:

I have an [ASRock Z790 PG-ITX/TB4](https://pg.asrock.com/MB/Intel/Z790%20PG-ITXTB4/index.asp) which has the `ALC4082` Realtek chipset connected over USB, that has been mentioned in a number of issues, most recently #229.

It seems the configuration changes in that issue (notably, https://github.com/hwchong/alsa-ucm-conf/commit/3ec7e6e2a61240764b77c30892f0bc56803799cc) work on my board as well, with a small modification. Unlike the Taichi boards, my Realtek audio driver is at `USB26ce:0a08`, not `USB26ce:0a06`. Making the necessary regex changes in `ALC4080-HiFi.conf` and `USB-Audio.conf` enables functionality on my board.

I am happy to make a PR to merge these changes if pertinent.

Thanks for the great work!


Update:
I am unable to get more than 2 channels through spdif either using AC3 or DTS

Issue URL     : https://github.com/alsa-project/alsa-ucm-conf/issues/334
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
