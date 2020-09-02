Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 654F625B549
	for <lists+alsa-devel@lfdr.de>; Wed,  2 Sep 2020 22:28:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 59E6A1864;
	Wed,  2 Sep 2020 22:28:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 59E6A1864
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1599078534;
	bh=L3zaxyNYFnNaorZ6kS5aJ3wM3xWqEV8ZcXGXyNe8/fg=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=KYuhXjlMW7t243UYG59mSiN32rOo5JG6yg9zNwqISadZR2GAQUpDzFS6A22P9DtyG
	 eSo4TgwDWcE8rpXVqkyb4uXr+v3fablbuE9H8/o8tari8eJxwhGiRFjuk2pBoJqtp7
	 2Phy/NRVDHwD9525kGTSqet6kxbBebh2/GZD0b7k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 02BBBF80212;
	Wed,  2 Sep 2020 22:27:11 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D5BCCF8024A; Wed,  2 Sep 2020 22:27:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AE568F800BA
 for <alsa-devel@alsa-project.org>; Wed,  2 Sep 2020 22:26:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AE568F800BA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="HNLI4KI4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599078418;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type;
 bh=cIAL4uSFyLFSVcItg2mcli0KRxTiY1/Wt15t2VmCv+8=;
 b=HNLI4KI4ekZ1qXm4+iCvXOmIlQAhIVm46V60x5gUZULJc+qtXvP06oK1aEjw9qye7P+M7m
 QbGjAvPcHjDd1lxcYefN3lNfc81JOtemwdm8slsj3ZvlRYgoXKlSANp7XmcCz9ELxzJMEV
 r73amXjzEhhrDbEMhe4Hh4PsKsArH7U=
Received: from mail-il1-f197.google.com (mail-il1-f197.google.com
 [209.85.166.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-385-kjLQvaTYPNO8Md96fG-VBA-1; Wed, 02 Sep 2020 16:26:56 -0400
X-MC-Unique: kjLQvaTYPNO8Md96fG-VBA-1
Received: by mail-il1-f197.google.com with SMTP id w82so605908ila.23
 for <alsa-devel@alsa-project.org>; Wed, 02 Sep 2020 13:26:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=cIAL4uSFyLFSVcItg2mcli0KRxTiY1/Wt15t2VmCv+8=;
 b=R7YUWkJdq4lJ49u4RsLhasYPSsducdZcQAtl2g3La5gmu/+b2eJbZqNV6N0cDOrqNK
 Z8cpGKvJIV6nwWJgoQwo3amlufl5pkEY+JVwvH0GY8kGjPzv8eyJHx220lksIGLHX2OM
 Ir4vAc+7eJYFzmqcDHkXIYOx66rJshtl+Gob0J2CTFGrJfkhSyPbfpcs9Xow88XpW2Y0
 AUZDaNFLzKYy9m0o/z4rcqeT/avRuN1DKFu48/1ySHm1BP5CmHOZgvodZlkxFuI/j5BL
 SuS+iPq6jzOF+urph2mB5nH2aYeLFzcdl2LOostP/ze3qkOXS/j8H6rWs42Wg0MiDN9e
 69yw==
X-Gm-Message-State: AOAM530pPY82X8WzK6PfhrVAsq4oLBPAXjYESOck7F4xzoG50a56cOJs
 U6YbhK3A6UW2keUJ8fEn2xUug/J7NRWTSBUVPoLUfapeNBn9cA/MmSVL6Nfgb7/MKUzXnSVou6R
 kG+uUQVO3A3XA0LYWWw03cA8=
X-Received: by 2002:a92:a1d4:: with SMTP id b81mr19934ill.152.1599078415905;
 Wed, 02 Sep 2020 13:26:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyA12e2y880FIcVpufJTfqjLja+2TIGbXlSF6n0WsreiuRt2D1J+eMlzyCBT8LQ2F8+uVeYPg==
X-Received: by 2002:a92:a1d4:: with SMTP id b81mr19902ill.152.1599078415553;
 Wed, 02 Sep 2020 13:26:55 -0700 (PDT)
Received: from trix.remote.csb (075-142-250-213.res.spectrum.com.
 [75.142.250.213])
 by smtp.gmail.com with ESMTPSA id i73sm330622ill.4.2020.09.02.13.26.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Sep 2020 13:26:55 -0700 (PDT)
From: trix@redhat.com
To: vkoul@kernel.org, yung-chuan.liao@linux.intel.com,
 pierre-louis.bossart@linux.intel.com, sanyog.r.kale@intel.com,
 natechancellor@gmail.com, ndesaulniers@google.com, shreyas.nc@intel.com
Subject: [PATCH v2] soundwire: fix double free of dangling pointer
Date: Wed,  2 Sep 2020 13:26:50 -0700
Message-Id: <20200902202650.14189-1-trix@redhat.com>
X-Mailer: git-send-email 2.18.1
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=trix@redhat.com
X-Mimecast-Spam-Score: 0.0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Cc: clang-built-linux@googlegroups.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, Tom Rix <trix@redhat.com>
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
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
v2 : change title, was 'soundwire: fix error handling'
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

