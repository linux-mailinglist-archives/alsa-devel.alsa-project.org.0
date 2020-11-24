Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 874662C30AD
	for <lists+alsa-devel@lfdr.de>; Tue, 24 Nov 2020 20:20:18 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1890C1754;
	Tue, 24 Nov 2020 20:19:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1890C1754
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1606245618;
	bh=jJK2cBFkktXid99i8a+DL7xqR0lATWWtJhM/8XAMfRQ=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=r5J5sJA2bUqg7u/6Y8klutT6raw5hxx1hQUGuKe91TgZWD2m4bPBp0SCtMutSPN+n
	 0Yg5nm9iUlRXXye2klKn0MZyQcI/Wrg5S8OQNEWT2oVRElUbw+LpmUejhUxfHXiMnU
	 PGfFBYyOob0Jgn3rAzY4imEfhXn0ukAB4JN/krC0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7B4D4F80166;
	Tue, 24 Nov 2020 20:18:44 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6BC6CF80165; Tue, 24 Nov 2020 20:18:42 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_FAIL,SPF_HELO_NONE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id E9CA3F800C1
 for <alsa-devel@alsa-project.org>; Tue, 24 Nov 2020 20:18:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E9CA3F800C1
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1606245517270976067-webhooks-bot@alsa-project.org>
References: <1606245517270976067-webhooks-bot@alsa-project.org>
Subject: SB Omni Surround 5.1
Message-Id: <20201124191842.6BC6CF80165@alsa1.perex.cz>
Date: Tue, 24 Nov 2020 20:18:42 +0100 (CET)
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

alsa-project/alsa-lib issue #101 was opened from witoldo7:

Hi,
SB Omni Surround 5.1 use default hw 1 for iec958.0 please update USB-Audio.conf, 0 is used for dac(jack connectors)

Issue URL     : https://github.com/alsa-project/alsa-lib/issues/101
Repository URL: https://github.com/alsa-project/alsa-lib
