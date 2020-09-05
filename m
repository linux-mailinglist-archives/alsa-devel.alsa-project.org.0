Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 01D9625E9D6
	for <lists+alsa-devel@lfdr.de>; Sat,  5 Sep 2020 21:28:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 04A77191A;
	Sat,  5 Sep 2020 21:27:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 04A77191A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1599334091;
	bh=zHRy5LjMBHe7xy2lmWGbKR36yvxGbIjufDIZMPZ5EVo=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=GGJXPKXYnnO7YbsTqQ8K4CqV1y9QFpOjy0/VNyG/poPM2037Jb+UQ0CkASWgKU5Tt
	 VfsTFsWisiyFF/HcJcRGBNXk3HwsXeURGfqagyTaBKWhCCvIRNxJuSpJ/LR3mF+sRN
	 DH7kRLeEwN/mHN2pH6CNXpDXUnZcf/RP7dD8A2ac=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 25BEDF8025F;
	Sat,  5 Sep 2020 21:26:30 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B6ABDF80217; Sat,  5 Sep 2020 21:26:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B4AEEF801DA
 for <alsa-devel@alsa-project.org>; Sat,  5 Sep 2020 21:26:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B4AEEF801DA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="P0QsSNVr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599333982;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type;
 bh=pFLFpRHDE4JFudYeKR0yB2Nja5ud5d8SymFz+afFxk4=;
 b=P0QsSNVrH7hdMUsY1av/mh6b11sA0xInL65BhO7Ls4beKQsZLKgxny5JTO4ibkwfKShUIL
 4lO+IWpdgUMPUcjfDs9t3UbJdzev0EMldxu2ZwtK11ZLZi2NSF1DA3VhtZxHIaZ1ADXeaG
 st8i0Q2VUF+3uap7WT12iil9qlytP40=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-116-DkEe7tcfO7CUlDkgAWwuVg-1; Sat, 05 Sep 2020 15:26:20 -0400
X-MC-Unique: DkEe7tcfO7CUlDkgAWwuVg-1
Received: by mail-qv1-f72.google.com with SMTP id h9so686341qvr.3
 for <alsa-devel@alsa-project.org>; Sat, 05 Sep 2020 12:26:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=pFLFpRHDE4JFudYeKR0yB2Nja5ud5d8SymFz+afFxk4=;
 b=iYdjWhvWyD0HwitBsYIkC2mHi11yiyE8iqBejCSW+IAWzsX1LFIy0cPEwwA55L0RRY
 wo36eWsN/Rg5bZK2BT5qj/Pw/EbvTXHZeN2rR2UdtpYJ+BX8fvsomjs5NxSdx83T8N5L
 I03YS1RDtAZWNpxKckL3TVfGEkQMa6npC65ou3lmssutZB53ZNs6b0gpaLJvAFk90PgJ
 +NDMGC6/f+DxLJu5uiuV/lg1M0E6hzXLHQAxklo5bhTqzcIYbbwZMUwJ/z5swqO6d90V
 AVdz8CskKNZufky0EGaUhnlPqH9DqueIpXtE8droejAI1xpRciM6esQJEidWg/QGIYOU
 HNEQ==
X-Gm-Message-State: AOAM5309rsMIt+snN+23jJhYvbDHsQPfCPzgdYs/M1CzVVO6Vm0sdQ/V
 ZQs58q9sssY4yncGlqV+8N0kZry5m2OXBuvDgLOZ39Ta3SLKavuth9bZxwfJgGnFj6y2O05snCa
 RMjpxU0MJpN4ycBtQRuXG3EY=
X-Received: by 2002:ac8:34f2:: with SMTP id x47mr14259678qtb.282.1599333979981; 
 Sat, 05 Sep 2020 12:26:19 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxpdiOw+3OCNQl3hZuFU+GukyxntgmDBJOZyso2aT1TQk3zSgsC1G1xvVExkVKxfw9qtEFPhQ==
X-Received: by 2002:ac8:34f2:: with SMTP id x47mr14259643qtb.282.1599333979497; 
 Sat, 05 Sep 2020 12:26:19 -0700 (PDT)
Received: from trix.remote.csb (075-142-250-213.res.spectrum.com.
 [75.142.250.213])
 by smtp.gmail.com with ESMTPSA id 134sm2389199qkj.53.2020.09.05.12.26.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 05 Sep 2020 12:26:18 -0700 (PDT)
From: trix@redhat.com
To: vkoul@kernel.org, yung-chuan.liao@linux.intel.com,
 pierre-louis.bossart@linux.intel.com, sanyog.r.kale@intel.com,
 natechancellor@gmail.com, ndesaulniers@google.com,
 guennadi.liakhovetski@linux.intel.com, kai.vehmanen@linux.intel.com
Subject: [PATCH] soundwire: stream: fix an invalid free
Date: Sat,  5 Sep 2020 12:26:13 -0700
Message-Id: <20200905192613.420-1-trix@redhat.com>
X-Mailer: git-send-email 2.18.1
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=trix@redhat.com
X-Mimecast-Spam-Score: 0.001
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

clang static analyzer reports this problem

stream.c:872:2: warning: Argument to kfree() is a constant
  address (18446744073709551092), which is not memory
  allocated by malloc()
        kfree(stream);
        ^~~~~~~~~~~~~

In sdw_shutdown_stream() the stream to free is set by
a call to snd_soc_dai_get_sdw_stream().  The problem block
is the check if the call was successful.

	if (!sdw_stream) {
		dev_err(rtd->dev, "no stream found...
		return;
	}

When snd_soc_dai_get_sdw_stream() fails, it does not
always return null, sometimes it returns -ENOTSUPP.

So also check for error codes.

Fixes: 4550569bd779 ("soundwire: stream: add helper to startup/shutdown streams")
Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/soundwire/stream.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soundwire/stream.c b/drivers/soundwire/stream.c
index 6e36deb505b1..950231d593c2 100644
--- a/drivers/soundwire/stream.c
+++ b/drivers/soundwire/stream.c
@@ -1913,7 +1913,7 @@ void sdw_shutdown_stream(void *sdw_substream)
 
 	sdw_stream = snd_soc_dai_get_sdw_stream(dai, substream->stream);
 
-	if (!sdw_stream) {
+	if (IS_ERR_OR_NULL(sdw_stream)) {
 		dev_err(rtd->dev, "no stream found for DAI %s", dai->name);
 		return;
 	}
-- 
2.18.1

