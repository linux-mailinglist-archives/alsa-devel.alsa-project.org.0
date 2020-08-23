Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C4C4724EAAF
	for <lists+alsa-devel@lfdr.de>; Sun, 23 Aug 2020 03:17:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 66F00167D;
	Sun, 23 Aug 2020 03:16:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 66F00167D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1598145437;
	bh=sQjMgaH3XiR+A804/sTBZPqeaQu+k7h51/yFUlneyEE=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=VRaUvktsIBnUFSU0EfUeZ5LJl3vZin+wWuDkLtEtmgf0bg7wUxvf/4M5swl8nKRpF
	 qItDSqK+ElTxU0LdZEg1jucsnY7eaBUGSAECuquQmSIzcYkFlybKib/8UsXZ4MlREk
	 /7t7xH5qbMYCXgOfY0pkZ0iDaVP9QW/PDO2hMlvA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A1106F80245;
	Sun, 23 Aug 2020 03:15:36 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6EBA8F8025A; Sun, 23 Aug 2020 03:15:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_FAIL,SPF_HELO_NONE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 22387F800B8
 for <alsa-devel@alsa-project.org>; Sun, 23 Aug 2020 03:15:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 22387F800B8
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1598145329750840902-webhooks-bot@alsa-project.org>
References: <1598145329750840902-webhooks-bot@alsa-project.org>
Subject: Is raw MIDI API  really raw ? (Running status)
Message-Id: <20200823011533.6EBA8F8025A@alsa1.perex.cz>
Date: Sun, 23 Aug 2020 03:15:33 +0200 (CEST)
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

alsa-project/alsa-lib issue #80 was opened from MusicMaker:

A device is sending always 3 bytes for note off/on event. The host application uses a virtual port to receive the data  The ALSA RAW MIDI API seems to remove the status byte if the channel of the status byte is the same. Once the channel changes, the RAW MIDI API provide the status byte to the higher level layer. Is this the bahaviour of the RAW MIDI API ? if yes then raw isn't actually raw. Can this  be disabled ? Could not find a parameter at port open to do this. (not using the sequencer)

Issue URL     : https://github.com/alsa-project/alsa-lib/issues/80
Repository URL: https://github.com/alsa-project/alsa-lib
