Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EF9599C01E
	for <lists+alsa-devel@lfdr.de>; Sat, 24 Aug 2019 22:30:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 897CB1669;
	Sat, 24 Aug 2019 22:29:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 897CB1669
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1566678623;
	bh=fsB4/iUIVOVghgf6t50Rey4jtkazjWdF7IWThRozZbY=;
	h=Date:In-Reply-To:References:From:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=tq0WmycvYRxQMVMZWXRPFD1QiB1YbyrX0tFvmART8hk0bhW8Iv8JmDA99/GTbHEWl
	 IENZPUUvaop6lJv2ir+gzPg9on2lPHnj2P2uL0aLpBey1G4hLzCQxQylWvWiQbbWoV
	 SdDLKcJ72OraMkcH/ZYVJSMbVrAZCKunEHF1C0iE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C71B5F805FD;
	Sat, 24 Aug 2019 22:27:13 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0A63CF805F5; Sat, 24 Aug 2019 22:27:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from rere.qmqm.pl (rere.qmqm.pl [91.227.64.183])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C2C82F8036E
 for <alsa-devel@alsa-project.org>; Sat, 24 Aug 2019 22:26:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C2C82F8036E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=rere.qmqm.pl header.i=@rere.qmqm.pl
 header.b="HLCnPEdy"
Received: from remote.user (localhost [127.0.0.1])
 by rere.qmqm.pl (Postfix) with ESMTPSA id 46G8sD20xTzX0;
 Sat, 24 Aug 2019 22:25:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=rere.qmqm.pl; s=1;
 t=1566678320; bh=yiTBq/DuyyKpDzXcgmYnUpaUSvdYXCpYBzYX6OrpC7I=;
 h=Date:In-Reply-To:References:From:Subject:To:Cc:From;
 b=HLCnPEdysqXSybASSetiJ6esb3pO/zLIItQaTDSr67J6FCKz1PPgVwOOhCbB4TBCB
 M0Z+QxSH05CeMcGS/qR0f9fZdjzJR8KUIgdKZgrGn+ao8YB4vGqo447fFXkW8EAa3N
 nCJN3DViDPex2opeTdzbwSm38sVs4n741ohb3XIa1qTVmNE5CCxShpM8GG/TBUMIdY
 mWZFJFXf/hvWrJF4GyRkOPdquVFpeWAoKk1vk7SZDd12eCl+6MVqSOcV713Bu4xKdB
 mPIe/UQjcm9XW53v8vEoLjzG0dFELFIwSRQ42ngEyNOHCJFjron35FaM+RJ+Aojm78
 vrYzHXR0Wp85Q==
X-Virus-Status: Clean
X-Virus-Scanned: clamav-milter 0.101.2 at mail
Date: Sat, 24 Aug 2019 22:26:55 +0200
Message-Id: <9b85d5a7c7e788e9ed87d020323ad9292e3aeab7.1566677788.git.mirq-linux@rere.qmqm.pl>
In-Reply-To: <cover.1566677788.git.mirq-linux@rere.qmqm.pl>
References: <cover.1566677788.git.mirq-linux@rere.qmqm.pl>
From: =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>
MIME-Version: 1.0
To: alsa-devel@alsa-project.org,
	devicetree@vger.kernel.org
Cc: Mark Rutland <mark.rutland@arm.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Mark Brown <broonie@kernel.org>, Chas Williams <3chas3@gmail.com>,
 Rob Herring <robh-dt@kernel.org>,
 Codrin Ciubotariu <codrin.ciubotariu@microchip.com>,
 linux-kernel@vger.kernel.org
Subject: [alsa-devel] [PATCH v2 4/6] dt-bindings: misc: atmel-ssc: LRCLK
 from TF/RF pin option
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

QWRkIHNpbmdsZS1waW4gTFJDTEsgc291cmNlIG9wdGlvbnMgZm9yIEF0bWVsIFNTQyBtb2R1bGUu
CgpTaWduZWQtb2ZmLWJ5OiBNaWNoYcWCIE1pcm9zxYJhdyA8bWlycS1saW51eEByZXJlLnFtcW0u
cGw+CgotLS0KICB2Mjogc3BsaXQgZnJvbSBpbXBsZW1lbnRhdGlvbiBwYXRjaAoKLS0tCiBEb2N1
bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbWlzYy9hdG1lbC1zc2MudHh0IHwgNSArKysr
KwogMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL0RvY3VtZW50
YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9taXNjL2F0bWVsLXNzYy50eHQgYi9Eb2N1bWVudGF0
aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbWlzYy9hdG1lbC1zc2MudHh0CmluZGV4IGY5ZmI0MTI2
NDJmZS4uYzk4ZTk2ZGJlYzNhIDEwMDY0NAotLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUv
YmluZGluZ3MvbWlzYy9hdG1lbC1zc2MudHh0CisrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJl
ZS9iaW5kaW5ncy9taXNjL2F0bWVsLXNzYy50eHQKQEAgLTI0LDYgKzI0LDExIEBAIE9wdGlvbmFs
IHByb3BlcnRpZXM6CiAgICAgICAgdGhpcyBwYXJhbWV0ZXIgdG8gY2hvb3NlIHdoZXJlIHRoZSBj
bG9jayBmcm9tLgogICAgICAtIEJ5IGRlZmF1bHQgdGhlIGNsb2NrIGlzIGZyb20gVEsgcGluLCBp
ZiB0aGUgY2xvY2sgZnJvbSBSSyBwaW4sIHRoaXMKICAgICAgICBwcm9wZXJ0eSBpcyBuZWVkZWQu
CisgIC0gYXRtZWwsbHJjbGstZnJvbS10Zi1waW46IGJvb2wgcHJvcGVydHkuCisgIC0gYXRtZWws
bHJjbGstZnJvbS1yZi1waW46IGJvb2wgcHJvcGVydHkuCisgICAgIC0gU1NDIGluIHNsYXZlIG1v
ZGUgZ2V0cyBMUkNMSyBmcm9tIFJGIGZvciByZWNlaXZlIGFuZCBURiBmb3IgdHJhbnNtaXQKKyAg
ICAgICBkYXRhIGRpcmVjdGlvbi4gVGhpcyBwcm9wZXJ0eSBtYWtlcyBib3RoIHVzZSBzaW5nbGUg
VEYgKG9yIFJGKSBwaW4KKyAgICAgICBhcyBMUkNMSy4gQXQgbW9zdCBvbmUgY2FuIGJlIHByZXNl
bnQuCiAgIC0gI3NvdW5kLWRhaS1jZWxsczogU2hvdWxkIGNvbnRhaW4gPDA+LgogICAgICAtIFRo
aXMgcHJvcGVydHkgbWFrZXMgdGhlIFNTQyBpbnRvIGFuIGF1dG9tYXRpY2FsbHkgcmVnaXN0ZXJl
ZCBEQUkuCiAKLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KQWxzYS1kZXZlbCBtYWlsaW5nIGxpc3QKQWxzYS1kZXZlbEBhbHNhLXByb2pl
Y3Qub3JnCmh0dHBzOi8vbWFpbG1hbi5hbHNhLXByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
YWxzYS1kZXZlbAo=
