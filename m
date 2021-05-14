Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DA293805A1
	for <lists+alsa-devel@lfdr.de>; Fri, 14 May 2021 10:56:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 12CF61781;
	Fri, 14 May 2021 10:55:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 12CF61781
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1620982581;
	bh=90DU4y+Im7B/yLbfwxO/FXWGAgAK/gQIQFIFhy6/KY8=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=goyJMtnQ9U97LhopViO68nrypb4biaDFZvstjNrdD1uQRCAzqGEuLykSFVsI0sLq8
	 tA6urxBx6vc2tbcGrqzvbdsYg9mZZVrFfxGP++EC1PHV77WG/CLoPhgY1q4kG0ViiA
	 sp3pFDt7uX0fK8QvZ2zsbx+NCshV3O8j8G9sXIq4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 81B65F8027D;
	Fri, 14 May 2021 10:54:52 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BCC93F8026F; Fri, 14 May 2021 10:54:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B6AE5F800BF
 for <alsa-devel@alsa-project.org>; Fri, 14 May 2021 10:54:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B6AE5F800BF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="Rf/GgCwz"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="GT1V+Yc7"
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 257C45C00EB;
 Fri, 14 May 2021 04:54:40 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Fri, 14 May 2021 04:54:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=fm1; bh=lnb+6q2h0W5MGkFA9FGhGi78eP
 uLzCbDzT2uQIUp/gA=; b=Rf/GgCwz8GUVoJfwo1JqdJD5WsGaw/SrYBoBbBqLxD
 GR9Rv6TZ51mVbUt/rtQcRTlHmn1E0Xmaux5WyM0tkaN5U1ce+2Qwgra65kSWAeT8
 LnWi0xPosaPPclHdxrpo1lN4WjuOuaxs6ghDGduAaQVKtuCZMAQhuMH3ZVTE05IO
 XljsgioIRx5X8xYf073zqPpm9F++YFBmocuQN+wSkqnybBzgQ7E14oMOyx5XEuhf
 gWY3MSKmlrYo+wBZQqxg3/pdoPEmC96gOvQwFbV4khTcelqMWrxer0MZeycBO10p
 cWIkQ9cpNgsq8WV+rgHkQT1u/Crm17gy6YA6X1ALUd0A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=lnb+6q2h0W5MGkFA9
 FGhGi78ePuLzCbDzT2uQIUp/gA=; b=GT1V+Yc7pMk8fakWyVPJtGZWKnIMI5ghY
 z+MXUN7D5/43qd9+vjV9qr2OLzJhlC1JdJe0QhEf+Z779SWfl7VSPtsw0QertMsO
 iAu3rCxEWZAfx2we7nzki+Ys4S5Chbtkvx9kizWiGdTNHf5ICBxZ0H41hQyLuXK4
 7aMqC7ZUdIBbIx+cUlLBGlt6B7JZpGPzM4nuVKIwAROoiX/ejeT6YWRz0PKLoJ9X
 9W6kyPj6V3BQRUlaNAxbkSFqJICdOi42XTGt3NOMkjjCj7fHbLbKmFGplrPnb+YR
 d7Ki7AHggQhbaFaEioCxK2t1W7UQuelb0fyRYgXGAwh9mnjA/kl4Q==
X-ME-Sender: <xms:zzqeYM6LbVJLsL9UVOa9RM_u-yh7UUrak5kPVjusbNqOxvWxO7qnRg>
 <xme:zzqeYN62HVITVRFfhjc6qGQcGeSarfPIzIRtU8a-FXUGqpiEam9a3dmg_Y2giqpAx
 _H_VvtARxkXckkUVrA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdehhedgudefjecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffoggfgsedtkeertd
 ertddtnecuhfhrohhmpefvrghkrghshhhiucfurghkrghmohhtohcuoehoqdhtrghkrghs
 hhhisehsrghkrghmohgttghhihdrjhhpqeenucggtffrrghtthgvrhhnpedujeetlefhtd
 dtkefgtdeuieelhffgteejjeehkeegveduvdevgeeiheeuueekjeenucfkphepudegrdef
 rdeihedrudejheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfh
 hrohhmpehoqdhtrghkrghshhhisehsrghkrghmohgttghhihdrjhhp
X-ME-Proxy: <xmx:zzqeYLeo-rin543nWctWDY9wL2mlADk-yqdAOPzC0UzB-nV0enVZJw>
 <xmx:zzqeYBKs5XUIfyomGSPlUHzOKPbcqNgU61Wbn0f_sdJcE_WVGb1T7Q>
 <xmx:zzqeYAI0PgSCS6ycEKRRx5Be3ORjGBPZpSoHWoGog4bjLuQMS9Jhdw>
 <xmx:0DqeYKyF2boZdbrrDLOx2rig-JN9b_SbUdqDzFIunTpQLf-ykF7Fhg>
Received: from workstation.flets-east.jp (ae065175.dynamic.ppp.asahi-net.or.jp
 [14.3.65.175]) by mail.messagingengine.com (Postfix) with ESMTPA;
 Fri, 14 May 2021 04:54:38 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: tiwai@suse.de
Subject: [PATCH 0/7] ALSA: oxfw: code refactoring for quirks specific to ASICs
Date: Fri, 14 May 2021 17:54:28 +0900
Message-Id: <20210514085435.92807-1-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, clemens@ladisch.de
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

Hi,

This patchset is for code refactoring to ALSA OXFW driver, mainly
regarding to ASIC types and quirks.


Takashi Sakamoto (7):
  ALSA: oxfw: code refactoring for existent device entry with
    specifier_id and version
  ALSA: oxfw: add device entry for Loud Technologies Tapco Link.FireWire
    4x6
  ALSA: oxfw: add explicit device entry for Loud Technologies Mackie
    Onyx Sattelite
  ALSA: oxfw: add comment for the type of ASICs
  ALSA: oxfw: code refactoring for jumbo-payload quirk in OXFW970
  ALSA: firewire-lib: code refactoring for jumbo payload quirk
  ALSA: oxfw; code refactoring for wrong_dbs quirk

 sound/firewire/amdtp-stream.c     |   7 +-
 sound/firewire/oxfw/oxfw-stream.c |  20 ++---
 sound/firewire/oxfw/oxfw.c        | 123 +++++++++++++-----------------
 sound/firewire/oxfw/oxfw.h        |  10 ++-
 4 files changed, 76 insertions(+), 84 deletions(-)

-- 
2.27.0

