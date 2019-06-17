Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9684148036
	for <lists+alsa-devel@lfdr.de>; Mon, 17 Jun 2019 13:08:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 134161722;
	Mon, 17 Jun 2019 13:07:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 134161722
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1560769693;
	bh=vhXPZq4cHSZB3Md8ZgY4uwj+r/5gR522tlWe9en+i0c=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=HUSZ9zk5Ny5/H5IEHCTia05A7Bkp8w9ALvLFXtyXSKhM2MxadqH1aGKOOTVBX9hvi
	 wXTobDW0c+MhGBl+MD2d23NQzeQuHIf7REiMh/6evBA6uMAUpACu9mcD9YJY3Wf/8M
	 og6VEw/z5gjGBvtjj5yhUKirTzkCwemSqdnN8Mqg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 81F6DF896DA;
	Mon, 17 Jun 2019 13:06:28 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8BCA5F896C7; Mon, 17 Jun 2019 13:06:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.73])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 05BB5F80764
 for <alsa-devel@alsa-project.org>; Mon, 17 Jun 2019 13:06:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 05BB5F80764
Received: from threadripper.lan ([149.172.19.189]) by mrelayeu.kundenserver.de
 (mreue108 [212.227.15.145]) with ESMTPA (Nemesis) id
 1MF35K-1hsBX83HGi-00FX24; Mon, 17 Jun 2019 13:06:18 +0200
From: Arnd Bergmann <arnd@arndb.de>
To: Mark Brown <broonie@kernel.org>
Date: Mon, 17 Jun 2019 13:06:15 +0200
Message-Id: <20190617110615.2084748-1-arnd@arndb.de>
X-Mailer: git-send-email 2.20.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:imZ+6nmN3JNLX3mmZ/m85Tw3DUGLuQRqfp+OHv0e6v8Sna1BTqb
 Ia0NkHUM0xOVTKecq7eJVkaHlweKCwVnWwuER+8zeP2Hz09xud7svdcbfGvspIytpP3UE0k
 jm+h/cewI2Dtv5LN95ENIk3DIIcvb+9z6TkyhTyIbk9snxwrP+i48H8bY+xJzBfbU8Roz14
 FevkcIEAZMFuRlJOjH38w==
X-UI-Out-Filterresults: notjunk:1;V03:K0:UWLRdc/oTTw=:LHC1wNVDSBgYr0e7hr3Y2a
 wVXYdnSRqTmZB8VMYxiVgLIa9BL3ZZ5VZpQNxxRjyG6Mtp2EN4cVv1/pUW0gVzsHnEuArbhg0
 1rEpVDQTWwW0NDzXrt6WQRO+7vcq9mtVdskwNjKU0QYdvvjePsBHcuZ85jDWoZC/cidNj8wey
 J7yTYoAjgdMaFy3PGgJbr6ZFmaJwQt73Lo1RXqDwkvipxqs+yXqJSoDGTtBkYOb9gnPCwsZRS
 3CyZ7cVtAgNeOFfc4ksfRqPVNwojfCfhXDZOhLyktpv/S57Xhn6IPMSUuvy8i4i3WCWauIOYd
 SFoIcidvUvCcekS9JW0LXYvyMccJqESJG6kDY3vpjENpPpKREvm4Z/K2TCR4pmBIqK5D06LZr
 xgBNNQzI1C2We5i6+ow2wyvvOc7Z3wlwGxVXtuDtWpSxcRtn+NYpcpBlhPwRvt7md06RKF1tF
 GfP5pif9+vPkUrbrjBc2PuGOe8ddC8SJPUDRWSOZXcrOYvhuA46Gip4g58CZCw1H8R9K4wjSs
 D4Mh9JtLq+rALuzsOxIQMng8iNCVKdkJrC+wpbHk65C0Ac3Z/2vZD9gF7q5zlXmCAXhgUp/vj
 HVAN3ZMo2i2KZQiw7xO8UkG5aADAAnI76lSafwybmtphKuEsccFGMqjz7rkm1GYBOrrQrKAqC
 uk+C7XGnBVSySyV/sTJMEXBLzVIDXUMb+uE6AOYSkchln31VcMCFhRWMtip1bl8zvoTyljWV8
 sEWIlOh7XBBVwpoVMVL/f9/+KMyaL3JA4OMzdQ==
Cc: simon.ho@synaptics.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>
Subject: [alsa-devel] [PATCH] ASoC: cx2072x: mark PM function as
	__maybe_unused
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

While the suspend function is already marked __maybe_unused,
the resume function is not, which leads to a warning when
CONFIG_PM is disabled:

sound/soc/codecs/cx2072x.c:1625:12: error: unused function 'cx2072x_runtime_resume' [-Werror,-Wunused-function]

Mark this one like the other one.

Fixes: a497a4363706 ("ASoC: Add support for Conexant CX2072X CODEC")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 sound/soc/codecs/cx2072x.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/cx2072x.c b/sound/soc/codecs/cx2072x.c
index f2cb35a50726..1c1ba7bea4d8 100644
--- a/sound/soc/codecs/cx2072x.c
+++ b/sound/soc/codecs/cx2072x.c
@@ -1622,7 +1622,7 @@ static int __maybe_unused cx2072x_runtime_suspend(struct device *dev)
 	return 0;
 }
 
-static int cx2072x_runtime_resume(struct device *dev)
+static int __maybe_unused cx2072x_runtime_resume(struct device *dev)
 {
 	struct cx2072x_priv *cx2072x = dev_get_drvdata(dev);
 
-- 
2.20.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
