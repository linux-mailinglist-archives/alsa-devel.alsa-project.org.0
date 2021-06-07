Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 00A4F39E748
	for <lists+alsa-devel@lfdr.de>; Mon,  7 Jun 2021 21:15:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 560D9167E;
	Mon,  7 Jun 2021 21:14:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 560D9167E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1623093301;
	bh=z2DVDAcY4deRDKpZcYMSa9+Zj0QLabPreKkffhyIpSs=;
	h=Date:From:To:Subject:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=ZZgXwINtUP3Cm462Ap5jo22Z5W8EIwELay1ePBx3C4PyJmo/bosSLjCg7Tf/dYhUp
	 mFrSmBS0oDtyaq/QgqiUK42hr/pIOOg2H5SrO3J3DJJp6BE/xoO+pRCmXoXwL8JV/2
	 gII11tImITiZ6cwkYrKF7dWZ1thoEj8eVGR1j6ps=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C974DF80276;
	Mon,  7 Jun 2021 21:13:32 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DC1DDF8026C; Mon,  7 Jun 2021 21:13:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from m.b4.vu (m.b4.vu [203.16.231.148])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BB59CF800DF
 for <alsa-devel@alsa-project.org>; Mon,  7 Jun 2021 21:13:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BB59CF800DF
Received: by m.b4.vu (Postfix, from userid 1000)
 id DBC10612FB14; Tue,  8 Jun 2021 04:43:11 +0930 (ACST)
Date: Tue, 8 Jun 2021 04:43:11 +0930
From: "Geoffrey D. Bennett" <g@b4.vu>
To: alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.de>
Subject: [PATCH V2 0/2] Read all configuration at init time
Message-ID: <cover.1623091570.git.g@b4.vu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Daniel Sales <daniel.sales.z@gmail.com>,
 Markus Schroetter <project.m.schroetter@gmail.com>,
 Vladimir Sadovnikov <sadko4u@gmail.com>, Alex Fellows <alex.fellows@gmail.com>
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

Version two of patches to add support for reading the mixer volumes
and mux configuration from the hardware when the driver is
initialising.

Changes since v1:
- fix missing endian conversion spotted by ktest bot

Geoffrey D. Bennett (2):
  ALSA: usb-audio: scarlett2: Read mixer volumes at init time
  ALSA: usb-audio: scarlett2: Read mux at init time

 sound/usb/mixer_scarlett_gen2.c | 227 ++++++++++++++++++++++----------
 1 file changed, 161 insertions(+), 66 deletions(-)

-- 
2.31.1

