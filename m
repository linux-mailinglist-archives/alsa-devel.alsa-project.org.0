Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 15C161599ED
	for <lists+alsa-devel@lfdr.de>; Tue, 11 Feb 2020 20:41:41 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8ED27165D;
	Tue, 11 Feb 2020 20:40:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8ED27165D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581450100;
	bh=FouvpyCNFgp+Rs5V44NBk+TrYI8OERX3ftUdnzbA+G4=;
	h=Date:From:To:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=MnaD86tm97h+/DDAO8Af1mVwzeRT1tMi/oQFcJDHxrd24CjCC7g4ob7gDLDkPpTz7
	 n1dEyMwroTi9hH3Yo1iSIESUx8aXj/q6FaiFr/pj++XAIeCD10YF9VeapHFtT2h6Fr
	 oYQaFYmPkiw/2nrG0EKrBGDuZootjL/W3y+qPQAQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8A441F800F0;
	Tue, 11 Feb 2020 20:39:59 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AA1E0F80145; Tue, 11 Feb 2020 20:39:57 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from gateway22.websitewelcome.com (gateway22.websitewelcome.com
 [192.185.47.168])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AE8CCF800F0
 for <alsa-devel@alsa-project.org>; Tue, 11 Feb 2020 20:39:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AE8CCF800F0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=embeddedor.com header.i=@embeddedor.com
 header.b="NdyQDeY1"
Received: from cm10.websitewelcome.com (cm10.websitewelcome.com [100.42.49.4])
 by gateway22.websitewelcome.com (Postfix) with ESMTP id 63FF17CA1
 for <alsa-devel@alsa-project.org>; Tue, 11 Feb 2020 13:39:51 -0600 (CST)
Received: from gator4166.hostgator.com ([108.167.133.22]) by cmsmtp with SMTP
 id 1bNvj5c8wEfyq1bNvjFbQz; Tue, 11 Feb 2020 13:39:51 -0600
X-Authority-Reason: nr=8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=embeddedor.com; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
 Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=n3MEAaSo+ySPB0dRTUiR+Yk3gNhROG/lQbEkZaa1y24=; b=NdyQDeY10ga3LJUt2mEUQXYizX
 GGnVRgiKkwBIo/n9rJmvYeMnNGcS/mniXbS3v2Th5jI2k1QV3I1E0QwVMXrQfqAtqnjJWu5u+n3Jz
 tyzDNAe0T6LkjhBQTApfCSDB1rRd+rsTtUb+EkbbK/uLNuFBYVDDAZBhG0r+y0DPIQlBi0iTI3kXj
 SPST3mjGZbdSp992CXwzoQsS9E/OWFl3fXZRxHY+lbvCA/GKGs+S9pmenaKOC8ATeZo0OjtnRpC1E
 /zmR5SU0fpdhtbMq9jA31DkENeTHoEvxpqNaNSeIh+kTbsR0H00P/wit+0QS5MxkEDTJvbqNW2KXu
 IqtDHizw==;
Received: from [200.68.140.36] (port=1945 helo=embeddedor)
 by gator4166.hostgator.com with esmtpa (Exim 4.92)
 (envelope-from <gustavo@embeddedor.com>)
 id 1j1bNt-001JBU-S3; Tue, 11 Feb 2020 13:39:49 -0600
Date: Tue, 11 Feb 2020 13:42:24 -0600
From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
To: Clemens Ladisch <clemens@ladisch.de>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>
Message-ID: <20200211194224.GA9383@embeddedor>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.9.4 (2018-02-28)
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - gator4166.hostgator.com
X-AntiAbuse: Original Domain - alsa-project.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - embeddedor.com
X-BWhitelist: no
X-Source-IP: 200.68.140.36
X-Source-L: No
X-Exim-ID: 1j1bNt-001JBU-S3
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: (embeddedor) [200.68.140.36]:1945
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 15
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Subject: [alsa-devel] [PATCH] ALSA: usb-midi: Replace zero-length array with
 flexible-array member
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

The current codebase makes use of the zero-length array language
extension to the C90 standard, but the preferred mechanism to declare
variable-length types such as these ones is a flexible array member[1][2],
introduced in C99:

struct foo {
        int stuff;
        struct boo array[];
};

By making use of the mechanism above, we will get a compiler warning
in case the flexible array does not occur last in the structure, which
will help us prevent some kind of undefined behavior bugs from being
inadvertenly introduced[3] to the codebase from now on.

This issue was found with the help of Coccinelle.

[1] https://gcc.gnu.org/onlinedocs/gcc/Zero-Length.html
[2] https://github.com/KSPP/linux/issues/21
[3] commit 76497732932f ("cxgb3/l2t: Fix undefined behaviour")

Signed-off-by: Gustavo A. R. Silva <gustavo@embeddedor.com>
---
 sound/usb/midi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/usb/midi.c b/sound/usb/midi.c
index b737f0ec77d0..f15d36731cbe 100644
--- a/sound/usb/midi.c
+++ b/sound/usb/midi.c
@@ -91,7 +91,7 @@ struct usb_ms_endpoint_descriptor {
 	__u8  bDescriptorType;
 	__u8  bDescriptorSubtype;
 	__u8  bNumEmbMIDIJack;
-	__u8  baAssocJackID[0];
+	__u8  baAssocJackID[];
 } __attribute__ ((packed));
 
 struct snd_usb_midi_in_endpoint;
-- 
2.25.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
