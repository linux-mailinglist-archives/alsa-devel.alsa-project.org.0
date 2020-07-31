Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DF63233FCC
	for <lists+alsa-devel@lfdr.de>; Fri, 31 Jul 2020 09:14:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E47A916AB;
	Fri, 31 Jul 2020 09:13:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E47A916AB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1596179679;
	bh=Hibj8sI4JuPodPDNBstTgbGFejxbOIJBs0QlOGxxomY=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=MNvSWbiu6Bk9WWYx+fj4juXOA6IZ90KIUFDcMbOLSS2nl0NinEsf8ve/RKiWgWvM5
	 3Kg+cph+yO55GeVHoogdbT95hiHa1V3S+eeEdRujdkUCxxCLt2Xccsp2nXHVvirYKf
	 T23KhyzZCfREy8vNdCleiqfMNnvHGfWn/9SVmeTA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EAFFDF801ED;
	Fri, 31 Jul 2020 09:12:44 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 161CDF801EB; Fri, 31 Jul 2020 09:12:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_FAIL,SPF_HELO_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 2D916F801A3
 for <alsa-devel@alsa-project.org>; Fri, 31 Jul 2020 09:12:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2D916F801A3
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - edited <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1596179557041157961-webhooks-bot@alsa-project.org>
References: <1596179557041157961-webhooks-bot@alsa-project.org>
Subject: Ubuntu 20.04 Internal Microphone is not working. Input Device
 drop-down menu is empty in Sound settings
Message-Id: <20200731071243.161CDF801EB@alsa1.perex.cz>
Date: Fri, 31 Jul 2020 09:12:43 +0200 (CEST)
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

alsa-project/alsa-utils issue #49 was edited from ReyanshKharga:

[Link to question](https://askubuntu.com/questions/1262607/ubuntu-20-04-internal-microphone-is-not-working-input-device-drop-down-menu-is)

Issue URL     : https://github.com/alsa-project/alsa-utils/issues/49
Repository URL: https://github.com/alsa-project/alsa-utils
