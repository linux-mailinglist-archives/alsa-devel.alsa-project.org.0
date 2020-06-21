Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AD5CA206E4C
	for <lists+alsa-devel@lfdr.de>; Wed, 24 Jun 2020 09:54:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 547031800;
	Wed, 24 Jun 2020 09:53:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 547031800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1592985289;
	bh=jWTQ+WGIrZSBRz4KCUcSFEWnN6XjGkiK7a9Ln61rrH4=;
	h=Date:To:From:Subject:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Reply-To:From;
	b=Nz5c1EJxYEjRtrTJuFlpNYwgJD9QfB2kbJz/8QRjI4JCKH14InF5bUVMv/ZCzUcUJ
	 7KNL3SgoxdmFu5L2T94qhvSrFNmh+Xtp3ordEPDIa4iDv/Z/n4bVxAnsZhZwE376Yi
	 2KFYivXxmL047hOMpfwFUi6PuTTj93ZI2AEz/z1w=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0ADBDF802F8;
	Wed, 24 Jun 2020 09:49:45 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E565BF80218; Sun, 21 Jun 2020 04:10:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_FROM, RCVD_IN_MSPIKE_H4, RCVD_IN_MSPIKE_WL,
 SPF_HELO_PASS, 
 SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-40136.protonmail.ch (mail-40136.protonmail.ch
 [185.70.40.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8029BF800D0
 for <alsa-devel@alsa-project.org>; Sun, 21 Jun 2020 04:09:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8029BF800D0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=protonmail.com header.i=@protonmail.com
 header.b="plTDZ0oB"
Date: Sun, 21 Jun 2020 02:09:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
 s=protonmail; t=1592705396;
 bh=AjsP4H149bFPmfkXn9C7jxdziDetDXX/A1aFwwKOXZk=;
 h=Date:To:From:Cc:Reply-To:Subject:From;
 b=plTDZ0oBsfeI7LT/UZRcjKlNLaGZgJq8KqYNh3AeiAvJuqpZGwukC1OMacn6O2ie7
 6HwYWU9TLJvQjXTFsw4szXsiQKF0w2SMLEpcwbUFMnjtBRK0/Z1mpmcHw4rrxMksZH
 iNTjM4Dd8zdo+3pp1zKCFyuB/dyutEM/OLUKBaH0=
To: alsa-devel@alsa-project.org
From: Colton Lewis <colton.w.lewis@protonmail.com>
Subject: Fwd: [PATCH] snd/soc: correct trivial kernel-doc inconsistency
Message-ID: <4574918.31r3eYUQgx@laptop.coltonlewis.name>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Wed, 24 Jun 2020 09:49:30 +0200
Cc: lgirdwood@gmail.com
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
Reply-To: Colton Lewis <colton.w.lewis@protonmail.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Can some please accept or comment on this patch?

----------  Forwarded Message  ----------

Subject: [PATCH] snd/soc: correct trivial kernel-doc inconsistency
Date: Saturday, June 13, 2020, 9:29:08 PM CDT
From: Colton Lewis <colton.w.lewis@protonmail.com>
To: lgirdwood@gmail.com
CC: trivial@kernel.org, Colton Lewis <colton.w.lewis@protonmail.com>



Silence documentation build warning by correcting kernel-doc comment
for snd_soc_runtime_action.

./sound/soc/soc-pcm.c:220: warning: Function parameter or member 'action' n=
ot described in 'snd_soc_runtime_action'

Signed-off-by: Colton Lewis <colton.w.lewis@protonmail.com>
---
 sound/soc/soc-pcm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
index 2c114b4542ce..9ab376844ac1 100644
--- a/sound/soc/soc-pcm.c
+++ b/sound/soc/soc-pcm.c
@@ -208,6 +208,7 @@ static inline void dpcm_remove_debugfs_state(struct snd=
_soc_dpcm *dpcm)
  * PCM runtime components
  * @rtd: ASoC PCM runtime that is activated
  * @stream: Direction of the PCM stream
+ * @action: Activate stream if 1. Deactivate if -1.
  *
  * Increments/Decrements the active count for all the DAIs and components
  * attached to a PCM runtime.
--=20
2.26.2


-----------------------------------------



