Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6615A14F87F
	for <lists+alsa-devel@lfdr.de>; Sat,  1 Feb 2020 16:30:04 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D438C1689;
	Sat,  1 Feb 2020 16:29:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D438C1689
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1580571003;
	bh=/46vHA0XHZJTL4obqanOm04voO9ZP8XYZ4Y+qTa25qo=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kYbYzEJCbkadtRn7XBdSMLuRh5kpMm9V9XhXcMXAcCsfgfJymt1Z7tL0GutiNJjcT
	 DLDXp2rJqU36Wc3q5LyvhmgzEcazw8tice+kulYmiv/ULO0/d6ZxlSRBOQl9qkMmbH
	 sbeifrfZxoxULIx6ypnxg7C2/Qw5uRA6pVYuGT9U=
Received: from vmi242170.contaboserver.net (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CA0E1F80082;
	Sat,  1 Feb 2020 16:28:22 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 419B5F801EB; Sat,  1 Feb 2020 16:28:14 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=HTML_MESSAGE,SPF_HELO_PASS,
 SPF_PASS autolearn=disabled version=3.4.0
Received: from larkos.de (larkos.de [188.68.52.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 60E8BF800D3
 for <alsa-devel@alsa-project.org>; Sat,  1 Feb 2020 16:28:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 60E8BF800D3
Received: from a89-182-229-237.net-htp.de ([89.182.229.237]
 helo=[192.168.178.12])
 by larkos.de with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <martin@larkos.de>)
 id 1ixugp-0006Gy-UM; Sat, 01 Feb 2020 16:28:08 +0100
To: nmahale@nvidia.com
References: <20191119084710.29267-5-nmahale@nvidia.com>
From: Martin Regner <martin@larkos.de>
Message-ID: <0b827293-cc8b-3c3e-9160-565037ff172b@larkos.de>
Date: Sat, 1 Feb 2020 16:28:08 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <20191119084710.29267-5-nmahale@nvidia.com>
Content-Language: en-GB
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Cc: alsa-devel@alsa-project.org, tiwai@suse.com, aplattner@nvidia.com
Subject: Re: [alsa-devel] [PATCH v3 4/4] ALSA: hda - Add DP-MST support for
 NVIDIA codecs
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

SGkgdGhlcmUsCgpzaW5jZSBpIHVwZGF0ZWQgdG8ga2VybmVsIDUuNSBpIGhhdmUgbm8gc291bmQg
b3ZlciBoZG1pIGFueW1vcmUgKEdlRm9yY2UgClJUWCAyMDcwKS4KCldpdGggdGhlIHByZXZpb3Vz
IGtlcm5lbCA1LjQuMTQgZXZlcnl0aGluZyBpcyBmaW5lLgoKQWx0aG91Z2ggaSBnb3Qgc291bmQg
d2l0aCBzcGVha2VyLXRlc3QgLUQgaGRtaTpDQVJEPU5WaWRpYSxERVY9MiAtYyAyIC1yIAo0NDEw
MCwgcGF2dWNvbnRyb2wgc2hvd3MgYWxsIGhkbWkgc291bmQgZGV2aWNlcyBhcyB1bnBsdWdnZWQu
CgpJIGJpc2VjdGVkIGl0IGRvd24gdG8gdGhpcyBjb21taXQgCig1Mzk4ZTk0ZmI3NTNkMDIyMzAx
ODI1ZWJmYTVmN2NmOGE2NjBkOGViKSBhbmQgY2hhbmdlZCB0aGUgbGluZQoKSERBX0NPREVDX0VO
VFJZKDB4MTBkZTAwOTMsICJHUFUgOTMgSERNSS9EUCIswqAgcGF0Y2hfbnZoZG1pKQoKdG8KCkhE
QV9DT0RFQ19FTlRSWSgweDEwZGUwMDkzLCAiR1BVIDkzIEhETUkvRFAiLMKgIHBhdGNoX252aGRt
aV9sZWdhY3kpCgpOb3cgaXQncyB3b3JraW5nIGFnYWluLiBJJ20gbm90IHN1cmUgaWYgdGhpcyBp
cyBhIHByb2JsZW0gd2l0aCAKcHVsc2VhdWRpbyBvciBpZiB0aGUgUlRYIDIwNzAgZG9lcyBub3Qg
c3VwcG9ydCB0aGUgbWVudGlvbmVkIGNvZGVjLgoKVGhhbmtzIGluIGFkdmFuY2UKCk1hcnRpbgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KQWxzYS1kZXZl
bCBtYWlsaW5nIGxpc3QKQWxzYS1kZXZlbEBhbHNhLXByb2plY3Qub3JnCmh0dHBzOi8vbWFpbG1h
bi5hbHNhLXByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8vYWxzYS1kZXZlbAo=
