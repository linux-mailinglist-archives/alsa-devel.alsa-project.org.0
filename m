Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D8F7D311030
	for <lists+alsa-devel@lfdr.de>; Fri,  5 Feb 2021 19:45:17 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7905D1679;
	Fri,  5 Feb 2021 19:44:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7905D1679
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1612550717;
	bh=nY/yvnnt76Msr5Ch8d/0nhUQuyrU8fZu5RLtkm30bXE=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hOhdBRqhWvGPknDDexvaGlVj2ziTb6wj1lzMhFVZQ6qt2S95KLO7c7AKKBHmvPWo5
	 hWiExDjtlKweiTZW2YIsr6xQrzWNrrKjCMUjb5ILaRhrF+gpdhyzHfvboJ1HIHFoCS
	 gPWlcz3LAAwsL9sBd55f367f9CWpFQsGP0EprXAc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D08C3F80156;
	Fri,  5 Feb 2021 19:43:45 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8D017F80139; Fri,  5 Feb 2021 19:43:42 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from hellmouth.base.nu (hellmouth.base.nu [192.248.168.186])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3CA88F800C0
 for <alsa-devel@alsa-project.org>; Fri,  5 Feb 2021 19:43:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3CA88F800C0
Received: from baphomet.hell (<unknown> [192.168.179.1])
 by hellmouth.base.nu (OpenSMTPD) with ESMTP id 1a660542;
 Fri, 5 Feb 2021 18:43:36 +0000 (UTC)
Received: from baphomet.hell (localhost [127.0.0.1])
 by baphomet.hell (OpenSMTPD) with ESMTP id 1a5da29b;
 Fri, 5 Feb 2021 18:43:36 +0000 (GMT)
Received: from localhost.localdomain ([192.168.178.2])
 by baphomet.hell with ESMTPSA id rnn3BtiRHWC5gQEAnQSWfg
 (envelope-from <livvy@base.nu>); Fri, 05 Feb 2021 18:43:35 +0000
From: Olivia Mackintosh <livvy@base.nu>
To: Takashi Iwai <tiwai@suse.de>
Subject: [PATCH v4 0/1] Add DJM-750 and simplify
Date: Fri,  5 Feb 2021 18:42:55 +0000
Message-Id: <20210205184256.10201-1-livvy@base.nu>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <s5h35yb5xip.wl-tiwai@suse.de>
References: <s5h35yb5xip.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Olivia Mackintosh <livvy@base.nu>,
 Fabian Lesniak <fabian@lesniak-it.de>
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

Hi Takashi,

Thank you for your feedback, it's very helpful. Attached is an updated
patch which should hopefully be correct this time =)

Kindest regards,
Olivia

Olivia Mackintosh (1):
  ALSA: usb-audio: Add DJM750 to Pioneer mixer quirk

 sound/usb/mixer_quirks.c | 336 +++++++++++++++++++++++++--------------
 1 file changed, 216 insertions(+), 120 deletions(-)

-- 
2.30.0

