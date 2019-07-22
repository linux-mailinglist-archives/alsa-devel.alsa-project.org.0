Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 297DA7088F
	for <lists+alsa-devel@lfdr.de>; Mon, 22 Jul 2019 20:29:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 85251182C;
	Mon, 22 Jul 2019 20:28:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 85251182C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1563820151;
	bh=lEwM/rUPAT0UL2CxBwoU7q8N2e7747/6nQ1XKGRMTKw=;
	h=Date:From:To:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=u3OT3myusFd9xAiQAyzpxUNzEe+RSu43/vMHavOCpnNm7xMSSGsKrvJOHpdSH0Tiv
	 s4HDQ5xbCKzr6C9RDkR8VHjxyJui1cKUWCR9SqlA7qKcs9gLyozTVYccckPv/IJE/i
	 52L5eZY1OA98O1hS6qRkN/jdN1bnO8fFHEnjWi7M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E0844F803D7;
	Mon, 22 Jul 2019 20:27:26 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E85CFF800F5; Mon, 22 Jul 2019 20:27:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from rere.qmqm.pl (rere.qmqm.pl [91.227.64.183])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 89B2CF800F5
 for <alsa-devel@alsa-project.org>; Mon, 22 Jul 2019 20:27:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 89B2CF800F5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=rere.qmqm.pl header.i=@rere.qmqm.pl
 header.b="HeXr2APr"
Received: from remote.user (localhost [127.0.0.1])
 by rere.qmqm.pl (Postfix) with ESMTPSA id 45sqmk21FrzB2;
 Mon, 22 Jul 2019 20:25:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=rere.qmqm.pl; s=1;
 t=1563819961; bh=KEiGdDoCPDGbowVAg3mwMmkSnaoLsq2RZhaCnpCsVYQ=;
 h=Date:From:Subject:To:Cc:From;
 b=HeXr2APrxAxL6voaSkr4VDM5iuc4eC2f0qD/oD5jAusrHvMCmjS7xhx6GLc4sWbEB
 vSVKNMv+KeXIcIAxSqzFTec9j8yuLYloXQ2tezdxcuZK+zznBaUzvVNSSyIMXNH/PC
 AxawEA/Kv/Mq5ORnM/hHCJahmKgKcQrgZEMQFg48NU9aqSsLIFCFZqxfGprv3ZTonZ
 H6a7ilPjqH2CisL40vKFQuAlTB0ipTzY+XdV3a3bjnxFZhovH2AVt4kEMbtcOVrGZA
 GGjr8uHXxWZiZqzWlkaGSXoU0OOzAaDHVpm6yI58Ur/IpJfMutYcz+yB383k3SBdSP
 hnRz452LMei6A==
X-Virus-Status: Clean
X-Virus-Scanned: clamav-milter 0.100.3 at mail
Date: Mon, 22 Jul 2019 20:27:17 +0200
Message-Id: <cover.1563819483.git.mirq-linux@rere.qmqm.pl>
From: =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>
MIME-Version: 1.0
To: alsa-devel@alsa-project.org
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Codrin Ciubotariu <codrin.ciubotariu@microchip.com>,
 linux-arm-kernel@lists.infradead.org
Subject: [alsa-devel] [PATCH 0/5] ASoC: atmel: extend SSC support
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

VGhpcyBzZXJpZXMgaW1wcm92ZXMgc3VwcG9ydCBmb3IgdmFyaW91cyBjb25maWd1cmF0aW9ucyB1
c2luZyBTU0MgbW9kdWxlCmFzIGltcGxlbWVudGVkIGluIEF0bWVsIFNBTUE1RHggU29Dcy4gUGF0
Y2hlcyBhcmU6CgoxLiBlbmFibGUgU1NDIGluIEtjb25maWcgZm9yIGF1ZGlvLWdyYXBoLWNhcmQg
c3VwcG9ydAoyLTMuIGltcGxlbWVudCBsZWZ0LWp1c3RpZmllZCBkYXRhIG1vZGUKNC01LiBmaXgg
c2hhcmVkIEZTWU5DIHNvdXJjZSBmb3Igc2xhdmUgbW9kZQoKUGF0Y2hlcyBhZ2FpbnN0IHRpd2Fp
L3NvdW5kL2Zvci1uZXh0IHRyZWUuIFlvdSBjYW4gYWxzbyBwdWxsIGZyb20KICAgaHR0cHM6Ly9y
ZXJlLnFtcW0ucGwvZ2l0L2xpbnV4CmJyYW5jaDoKICAgYXRtZWwtc3NjCgpNaWNoYcWCIE1pcm9z
xYJhdyAoNSk6CiAgQVNvQzogYXRtZWw6IGVuYWJsZSBTU0NfUENNX0RNQSBpbiBLY29uZmlnCiAg
QVNvQzogYXRtZWxfc3NjX2RhaTogcmV3b3JrIERBSSBmb3JtYXQgY29uZmlndXJhdGlvbgogIEFT
b0M6IGF0bWVsX3NzY19kYWk6IGltcGxlbWVudCBsZWZ0LWp1c3RpZmllZCBkYXRhIG1vZGUKICBB
U29DOiBhdG1lbF9zc2NfZGFpOiBzcGxpdCBUWC9SWCBGUyBjb25zdGFudHMKICBBU29DOiBhdG1l
bF9zc2NfZGFpOiBFbmFibGUgc2hhcmVkIEZTWU5DIHNvdXJjZSBpbiBmcmFtZS1zbGF2ZSBtb2Rl
CgogLi4uL2RldmljZXRyZWUvYmluZGluZ3MvbWlzYy9hdG1lbC1zc2MudHh0ICAgIHwgICA0ICsK
IGRyaXZlcnMvbWlzYy9hdG1lbC1zc2MuYyAgICAgICAgICAgICAgICAgICAgICB8ICAgMiArCiBp
bmNsdWRlL2xpbnV4L2F0bWVsLXNzYy5oICAgICAgICAgICAgICAgICAgICAgfCAgIDEgKwogc291
bmQvc29jL2F0bWVsL0tjb25maWcgICAgICAgICAgICAgICAgICAgICAgIHwgICAyICstCiBzb3Vu
ZC9zb2MvYXRtZWwvYXRtZWxfc3NjX2RhaS5jICAgICAgICAgICAgICAgfCAzMDYgKysrKysrLS0t
LS0tLS0tLS0tCiBzb3VuZC9zb2MvYXRtZWwvYXRtZWxfc3NjX2RhaS5oICAgICAgICAgICAgICAg
fCAgIDkgKy0KIDYgZmlsZXMgY2hhbmdlZCwgMTIwIGluc2VydGlvbnMoKyksIDIwNCBkZWxldGlv
bnMoLSkKCi0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCkFsc2EtZGV2ZWwgbWFpbGluZyBsaXN0CkFsc2EtZGV2ZWxAYWxzYS1wcm9qZWN0
Lm9yZwpodHRwczovL21haWxtYW4uYWxzYS1wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Fs
c2EtZGV2ZWwK
