Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ACED345204
	for <lists+alsa-devel@lfdr.de>; Mon, 22 Mar 2021 22:49:27 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0255715E2;
	Mon, 22 Mar 2021 22:48:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0255715E2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1616449767;
	bh=vpPod5X4Q6EuLa8mZLHO5mHBvhGXJydMWAYt3W1e32k=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=AwnKsCqPCaN2rzJNYJqcbNTKI1ro8ceV7mI3qhC1ZbAN26mzVm1ZwSm3VVAIyy+RU
	 sXgAvsXNWAms6YNNX1nODtodQHG/ExBYzM2vIWaLft71yU4snH82gSkEGt3tA36ZAw
	 wBG0xsIBMZm3OPAsZ+lKb/FEqoQYv5OcvQpkQhVk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 84AD0F80155;
	Mon, 22 Mar 2021 22:48:01 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EE48EF8016B; Mon, 22 Mar 2021 22:47:58 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 5E137F80107
 for <alsa-devel@alsa-project.org>; Mon, 22 Mar 2021 22:47:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5E137F80107
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1616449675592206955-webhooks-bot@alsa-project.org>
References: <1616449675592206955-webhooks-bot@alsa-project.org>
Subject: alsaloop man page error
Message-Id: <20210322214758.EE48EF8016B@alsa1.perex.cz>
Date: Mon, 22 Mar 2021 22:47:58 +0100 (CET)
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

alsa-project/alsa-utils issue #82 was opened from nootc:

There is a small typo in the alsaloop man page:
https://github.com/alsa-project/alsa-utils/blob/c9e9a79c6cfef3212bdb5f9be4f6ea1d2a5e8670/alsaloop/alsaloop.1#L76-L86
"-c" is used for both "channels" and "rate". Thankfully, the source thinks otherwise and "-r" is used for "rate".

Issue URL     : https://github.com/alsa-project/alsa-utils/issues/82
Repository URL: https://github.com/alsa-project/alsa-utils
