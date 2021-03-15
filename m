Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 12AE433AB85
	for <lists+alsa-devel@lfdr.de>; Mon, 15 Mar 2021 07:16:00 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 95962175A;
	Mon, 15 Mar 2021 07:15:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 95962175A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1615788959;
	bh=o5hdTgJhsyh/74kn8gMVr80PHEmNkwXymftX1sOWoC4=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=H710mLpTNSdS1Mtx9/aqBHbcHeH7B+V863IGl6QijsnsGWrJy3nYrmMzKqYHMkWWd
	 JP2gePY8kqyB51uJ+Jfvf4757RUsHJTxc6AT2QH7RmYj9LKRtrVao2FcxhNv8xUhEO
	 ibbF/X+A7dcVLv1Uax/88JeI5+jcPk3bIIRA8SZw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 764BCF8010E;
	Mon, 15 Mar 2021 07:14:30 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D26F4F80171; Mon, 15 Mar 2021 07:14:27 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.8 required=5.0 tests=MISSING_DATE,MISSING_MID,
 PRX_BODY_65,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id EDE6AF80163
 for <alsa-devel@alsa-project.org>; Mon, 15 Mar 2021 07:14:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EDE6AF80163
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - edited <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1615788861172715902-webhooks-bot@alsa-project.org>
References: <1615788861172715902-webhooks-bot@alsa-project.org>
Subject: Wrong description in emu0404_netlist.h
Message-Id: <20210315061427.D26F4F80171@alsa1.perex.cz>
Date: Mon, 15 Mar 2021 07:14:27 +0100 (CET)
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

alsa-project/alsa-firmware issue #4 was edited from Usr666x:

It says: 
> This is the FPGA firmware for EMU Systems's Audio Dock,
> Present in the EMU1820 and EMU1820m products.
> It is nicknamed "audio_dock".

This is a mistake because it's a description taken from audio_dock_netlist.h. 
emu0404 should have its own description.

Issue URL     : https://github.com/alsa-project/alsa-firmware/issues/4
Repository URL: https://github.com/alsa-project/alsa-firmware
