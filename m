Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 637D3258C97
	for <lists+alsa-devel@lfdr.de>; Tue,  1 Sep 2020 12:18:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8D08817A9;
	Tue,  1 Sep 2020 12:17:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8D08817A9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1598955497;
	bh=6wQXbBXc//g3HGXHz9gHAUKs9LqNG+owfpn4u26Irno=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=c1J770zX73y9AcKyN4c8Ctfgakh7n5Psz82GnNgfsKBGSaMOAxEt3o6CQDEPpGJzt
	 RjgIitrNgRYdFXb/zQBoYoCEb1k5FN72FTSTOZLfAesqmoSljv3xEeLmtvRcyA5dYa
	 taUGabyw0G4kG/HYTCAvtinC+UkaYw4rOYw5D7Z0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BCD78F80278;
	Tue,  1 Sep 2020 12:15:53 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4D83FF8025A; Sat, 29 Aug 2020 17:35:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id ABC9EF8014E
 for <alsa-devel@alsa-project.org>; Sat, 29 Aug 2020 17:35:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ABC9EF8014E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="DxfU35u6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1598715323;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type;
 bh=qmmPLRQSTKQjwJoLTLyS2w23N792Fkd1ROx5b2pWcYU=;
 b=DxfU35u67L3x4baYyE+v9XIld+H2vIwficC1f9pzRwojPmT1cSD48co81nM9KmQfITgtXQ
 3c3CDkLBzA/+Mp6Aioh/Flxneyv6G68IWAVY/ys6CHZDie1gZh1BGQHf/Nu2I10g+3AU3k
 oHRdXWY6r+qJOAhvP0NqllIfUDs4bCU=
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com
 [209.85.210.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-300-XbxXnG_DO16PR5ZPtwnSww-1; Sat, 29 Aug 2020 11:35:21 -0400
X-MC-Unique: XbxXnG_DO16PR5ZPtwnSww-1
Received: by mail-ot1-f71.google.com with SMTP id r18so1318006otq.6
 for <alsa-devel@alsa-project.org>; Sat, 29 Aug 2020 08:35:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=qmmPLRQSTKQjwJoLTLyS2w23N792Fkd1ROx5b2pWcYU=;
 b=ZW075cvyR0M9Tcpjo2KBBqZqLSW7oWscIId1KznVgyCBzsmrwWilEABvC/KlO8Qr7p
 X/nnPC+QUJwOsADRyAQ9lKudqPgFPPo+KFrJO+l1FuvH7Zyad0yEUcY6fgp4qUUSMw1J
 abbgdRe7YalbG+oM8R+rbs48ziiI4RnWQthiFVWueKLpoXP5cqACkjoMzuNP+jqvtOm7
 TD/JlVtr+gGdDPqtRCQYRqCq06DXOmces77xq5IMCIkFWUiIHx2yaU7ZG889obAky+VI
 DKEPdoBz/u4kgYr6l/lOg0t5Uv1RT9Zkz9xE8cFM4NpgscustbBLQ4F+h+ra4QV4/k7z
 uS+Q==
X-Gm-Message-State: AOAM533NmbqljUaTFKpZWF97YqnUNV8tACc+GX6EVODdEaqyFcHT12qz
 jLZPA+E3g2CM+N0N2epnntaOpYMEJ8Knf8rM9Irw6F/l/O8N6RqLB7Zsfc88IetrqNZhp9tYeKI
 nycmJP5ctr0D4Z5wq/AlByuA=
X-Received: by 2002:a9d:c64:: with SMTP id 91mr2355442otr.59.1598715321082;
 Sat, 29 Aug 2020 08:35:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzvYyZNzj2QwclEeBTiTUzzukf5QXLtgqUFvURZjHxxRdmyDGTyXa8nonkQGGQ/TLdoaTTojg==
X-Received: by 2002:a9d:c64:: with SMTP id 91mr2355412otr.59.1598715320674;
 Sat, 29 Aug 2020 08:35:20 -0700 (PDT)
Received: from trix.remote.csb (075-142-250-213.res.spectrum.com.
 [75.142.250.213])
 by smtp.gmail.com with ESMTPSA id t22sm226211otq.44.2020.08.29.08.35.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 29 Aug 2020 08:35:20 -0700 (PDT)
From: trix@redhat.com
To: vkoul@kernel.org, yung-chuan.liao@linux.intel.com,
 pierre-louis.bossart@linux.intel.com, sanyog.r.kale@intel.com,
 natechancellor@gmail.com, ndesaulniers@google.com, shreyas.nc@intel.com
Subject: [PATCH] soundwire: fix error handling
Date: Sat, 29 Aug 2020 08:35:15 -0700
Message-Id: <20200829153515.3840-1-trix@redhat.com>
X-Mailer: git-send-email 2.18.1
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=trix@redhat.com
X-Mimecast-Spam-Score: 0.0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
X-Mailman-Approved-At: Tue, 01 Sep 2020 12:15:51 +0200
Cc: Tom Rix <trix@redhat.com>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
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

From: Tom Rix <trix@redhat.com>

clang static analysis flags this problem

stream.c:844:9: warning: Use of memory after
  it is freed
        kfree(bus->defer_msg.msg->buf);
              ^~~~~~~~~~~~~~~~~~~~~~~

This happens in an error handler cleaning up memory
allocated for elements in a list.

	list_for_each_entry(m_rt, &stream->master_list, stream_node) {
		bus = m_rt->bus;

		kfree(bus->defer_msg.msg->buf);
		kfree(bus->defer_msg.msg);
	}

And is triggered when the call to sdw_bank_switch() fails.
There are a two problems.

First, when sdw_bank_switch() fails, though it frees memory it
does not clear bus's reference 'defer_msg.msg' to that memory.

The second problem is the freeing msg->buf. In some cases
msg will be NULL so this will dereference a null pointer.
Need to check before freeing.

Fixes: 99b8a5d608a6 ("soundwire: Add bank switch routine")
Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/soundwire/stream.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/soundwire/stream.c b/drivers/soundwire/stream.c
index 37290a799023..6e36deb505b1 100644
--- a/drivers/soundwire/stream.c
+++ b/drivers/soundwire/stream.c
@@ -717,6 +717,7 @@ static int sdw_bank_switch(struct sdw_bus *bus, int m_rt_count)
 	kfree(wbuf);
 error_1:
 	kfree(wr_msg);
+	bus->defer_msg.msg = NULL;
 	return ret;
 }
 
@@ -840,9 +841,10 @@ static int do_bank_switch(struct sdw_stream_runtime *stream)
 error:
 	list_for_each_entry(m_rt, &stream->master_list, stream_node) {
 		bus = m_rt->bus;
-
-		kfree(bus->defer_msg.msg->buf);
-		kfree(bus->defer_msg.msg);
+		if (bus->defer_msg.msg) {
+			kfree(bus->defer_msg.msg->buf);
+			kfree(bus->defer_msg.msg);
+		}
 	}
 
 msg_unlock:
-- 
2.18.1

