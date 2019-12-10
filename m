Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AC627119AA7
	for <lists+alsa-devel@lfdr.de>; Tue, 10 Dec 2019 23:06:49 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 282EB1664;
	Tue, 10 Dec 2019 23:05:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 282EB1664
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1576015609;
	bh=7oX5bSSMdcfKX+YCyuTG4WDZV4qrh2om9oTga6GZspY=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CzojaslWVfF7Y4vcMC8yYJ23MeKVruf20DwA2EhnOpd9bFYMoTSVLxpjHhP7YMBbW
	 nwkjaST655YSn2vTDwBoLG/8NQvHra4YB8XOxuSoJq5hbXrZH5ktjKkinOo3By40o8
	 sIHPEmtsgVwQAhUEteknz6cznZWzd0QfFXBtmzwQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4D113F80254;
	Tue, 10 Dec 2019 23:04:42 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 77613F8024A; Tue, 10 Dec 2019 23:04:40 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9F99DF800F3
 for <alsa-devel@alsa-project.org>; Tue, 10 Dec 2019 23:04:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9F99DF800F3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="WWsrAqW4"
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 1E9A02073B;
 Tue, 10 Dec 2019 22:04:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1576015475;
 bh=+FSfsTMhWnVbXHveRqF4bTYhm7dm42KvOsciyFqV9ek=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=WWsrAqW49fmgtunHsknrKAREpJfI41OBjmr617EMUq9jzjX9SPXmT0GO2HoICiq4k
 WyGqmbXXEBFfrfkTvBvZ/yCxPbU2v4qluBFLbAprkQYb93Sf27TQ+DWTN8GHQMTrmW
 Q+qzzH1ro74HnQnAeiyx0Si8C7HotQJeF+vvo+WY=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Date: Tue, 10 Dec 2019 17:02:11 -0500
Message-Id: <20191210220301.13262-80-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191210220301.13262-1-sashal@kernel.org>
References: <20191210220301.13262-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Cc: Takashi Iwai <tiwai@suse.de>, Sasha Levin <sashal@kernel.org>,
 alsa-devel@alsa-project.org
Subject: [alsa-devel] [PATCH AUTOSEL 4.14 080/130] ALSA: timer: Limit max
	amount of slave instances
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

From: Takashi Iwai <tiwai@suse.de>

[ Upstream commit fdea53fe5de532969a332d6e5e727f2ad8bf084d ]

The fuzzer tries to open the timer instances as much as possible, and
this may cause a system hiccup easily.  We've already introduced the
cap for the max number of available instances for the h/w timers, and
we should put such a limit also to the slave timers, too.

This patch introduces the limit to the multiple opened slave timers.
The upper limit is hard-coded to 1000 for now, which should suffice
for any practical usages up to now.

Link: https://lore.kernel.org/r/20191106154257.5853-1-tiwai@suse.de
Signed-off-by: Takashi Iwai <tiwai@suse.de>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/core/timer.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/sound/core/timer.c b/sound/core/timer.c
index c60dfd52e8a6d..22589a073423b 100644
--- a/sound/core/timer.c
+++ b/sound/core/timer.c
@@ -88,6 +88,9 @@ static LIST_HEAD(snd_timer_slave_list);
 /* lock for slave active lists */
 static DEFINE_SPINLOCK(slave_active_lock);
 
+#define MAX_SLAVE_INSTANCES	1000
+static int num_slaves;
+
 static DEFINE_MUTEX(register_mutex);
 
 static int snd_timer_free(struct snd_timer *timer);
@@ -266,6 +269,10 @@ int snd_timer_open(struct snd_timer_instance **ti,
 			err = -EINVAL;
 			goto unlock;
 		}
+		if (num_slaves >= MAX_SLAVE_INSTANCES) {
+			err = -EBUSY;
+			goto unlock;
+		}
 		timeri = snd_timer_instance_new(owner, NULL);
 		if (!timeri) {
 			err = -ENOMEM;
@@ -275,6 +282,7 @@ int snd_timer_open(struct snd_timer_instance **ti,
 		timeri->slave_id = tid->device;
 		timeri->flags |= SNDRV_TIMER_IFLG_SLAVE;
 		list_add_tail(&timeri->open_list, &snd_timer_slave_list);
+		num_slaves++;
 		err = snd_timer_check_slave(timeri);
 		if (err < 0) {
 			snd_timer_close_locked(timeri, &card_dev_to_put);
@@ -364,6 +372,8 @@ static int snd_timer_close_locked(struct snd_timer_instance *timeri,
 	struct snd_timer_instance *slave, *tmp;
 
 	list_del(&timeri->open_list);
+	if (timeri->flags & SNDRV_TIMER_IFLG_SLAVE)
+		num_slaves--;
 
 	/* force to stop the timer */
 	snd_timer_stop(timeri);
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
