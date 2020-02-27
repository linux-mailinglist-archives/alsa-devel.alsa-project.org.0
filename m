Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A52A170EC0
	for <lists+alsa-devel@lfdr.de>; Thu, 27 Feb 2020 03:53:05 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D70AE1693;
	Thu, 27 Feb 2020 03:52:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D70AE1693
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1582771984;
	bh=QwPvNi1yXC27mGmA7ZC/3F+vAH+TOXq2xW+oFS0F6Sk=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=V+rnLxlpK3qEFAXegYIvbhBJnpS0/f/Mgz9v2aoO/LdWSwVUL2rPT2C6+A3iZdws8
	 +uH1zTJN/WRlV+vTAxglkj0aeKwi9u8uIE5fyMw4SAPEfOjXofXk4Iy+FZWYb+ovbr
	 MNTC0JY8f+1LvZ6p7c4b0agHAZ79uMNoJJejRefM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 72632F802C3;
	Thu, 27 Feb 2020 03:49:48 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DC675F802C2; Thu, 27 Feb 2020 03:49:45 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_FAIL,SPF_HELO_NONE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 65F9FF8025E
 for <alsa-devel@alsa-project.org>; Thu, 27 Feb 2020 03:49:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 65F9FF8025E
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1582771782775386095-webhooks-bot@alsa-project.org>
References: <1582771782775386095-webhooks-bot@alsa-project.org>
Subject: snd_rawmidi_params_set_no_active_sensing()
Message-Id: <20200227024945.DC675F802C2@alsa1.perex.cz>
Date: Thu, 27 Feb 2020 03:49:45 +0100 (CET)
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

alsa-project/alsa-lib issue #29 was opened from MusicMaker:

Does this filter out receiving 0xFE incoming and outgoing messages when enabled ? Still see incoming active sensing messages after using this.

Issue URL     : https://github.com/alsa-project/alsa-lib/issues/29
Repository URL: https://github.com/alsa-project/alsa-lib
