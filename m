Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ABA3B4CEC11
	for <lists+alsa-devel@lfdr.de>; Sun,  6 Mar 2022 16:22:07 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2F38F1749;
	Sun,  6 Mar 2022 16:21:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2F38F1749
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646580127;
	bh=GSdqzw1/RvziA+lOvp3BMqWA5kKlyvwaqxlgHpZDXFA=;
	h=Date:From:To:Subject:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=qHoQtA2fp+IBnCBLs/NUwiXoSSCmVFYYft4uTrxizcUB2XIu+gWElHU607ZGj7aTA
	 h/Cj3N5DAOlbycYozYoI1bZFkm9vllOLIxTUvDIG7SALEe1VG708PFpziVnJ1m5iCJ
	 a9jNSLpFEBDJLecqPecTrGiA6GK0ubQXLPjQwZFM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 918C7F800E9;
	Sun,  6 Mar 2022 16:20:59 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C3A1BF8014C; Sun,  6 Mar 2022 16:20:57 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from m.b4.vu (m.b4.vu [203.16.231.148])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 724F7F8014C
 for <alsa-devel@alsa-project.org>; Sun,  6 Mar 2022 16:20:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 724F7F8014C
Received: by m.b4.vu (Postfix, from userid 1000)
 id E56B16135FCC; Mon,  7 Mar 2022 01:50:40 +1030 (ACDT)
Date: Mon, 7 Mar 2022 01:50:40 +1030
From: "Geoffrey D. Bennett" <g@b4.vu>
To: alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.de>
Subject: [PATCH 0/2] ALSA: scarlett2: Add "Standalone" switch
Message-ID: <cover.1646578164.git.g@b4.vu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Hin-Tak Leung <htl10@users.sourceforge.net>,
 Vladimir Sadovnikov <sadko4u@gmail.com>
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

I discovered an internal "standalone" switch on all the Scarlett Gen
2/3 interfaces with internal mixers. After enabling this switch, the
interface will act as a standalone mixer (according to its previous
configuration) when not connected to a USB host. The interfaces come
from the factory with the switch off, and the vendor driver enables it
without question. This patch adds a new ALSA control to set the switch
on or off.

This is the first configuration item that is common between the Gen 2
and 3 interfaces but with a different offset, so the patch is in two
parts. The first patch allows for the same configuration item to have
a different offset between Gen 2/3 and the second patch adds the new
switch.

Regards,
Geoffrey.

Geoffrey D. Bennett (2):
  ALSA: scarlett2: Split scarlett2_config_items[] into 3 sections
  ALSA: scarlett2: Add support for the internal "standalone" switch

 sound/usb/mixer_scarlett_gen2.c | 171 ++++++++++++++++++++++++++------
 1 file changed, 141 insertions(+), 30 deletions(-)

-- 
2.35.1

