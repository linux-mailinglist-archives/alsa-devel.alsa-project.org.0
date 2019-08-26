Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DBFC9C779
	for <lists+alsa-devel@lfdr.de>; Mon, 26 Aug 2019 04:55:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 099691672;
	Mon, 26 Aug 2019 04:54:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 099691672
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1566788121;
	bh=+2uzI10cY9VEkJ1lp61Caq9TuBJD/qmHS4DssYJa4Mk=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=F2SGEzzSy6miMe0tIAq8UBLmVJvF5fds7DzS+2mj2A8CNZU/8l68bTBG1/tozYenk
	 h5U9kLhXS1I1500YdVZWdrI2Ob05lo8kUw5cgCpl7TYNrIDcZGPdxlVLgabeLK/ED0
	 gVtN2XZLsVFjkXYYK3k0JXKOJTJFUKDacX/UH/WM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 91ADBF802BC;
	Mon, 26 Aug 2019 04:53:39 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 078E2F80362; Mon, 26 Aug 2019 04:53:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com
 [IPv6:2607:f8b0:4864:20::744])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1542AF801ED
 for <alsa-devel@alsa-project.org>; Mon, 26 Aug 2019 04:53:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1542AF801ED
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=endlessm-com.20150623.gappssmtp.com
 header.i=@endlessm-com.20150623.gappssmtp.com header.b="vjJ4cLvH"
Received: by mail-qk1-x744.google.com with SMTP id r21so13006939qke.2
 for <alsa-devel@alsa-project.org>; Sun, 25 Aug 2019 19:53:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=endlessm-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=W0DKLeXeBCn4HSQPBp6hYRBMjTdyNzAMlLaQA2xi4SA=;
 b=vjJ4cLvHSd6uZNBnkzacvp6uTJWXzAIkcQSFMfixwPzHWA2oT/B9v8KAPd2Jd/gzPy
 ghUpyCipu2pbtCVi+WoveDJE5pgMZCJdp3hWzATXyNDSbZGav+JlUPhpJiwHUB5ExR2Y
 8Fvh3HBFj7vJq5cjao6B8rEe0P3vvOf901GIE0E2ONT1RqWQY9snFTjaNZte/N8JolyX
 ihdzyZankYOPPnLYIGpMTS27Lb5dsoAePtzmWVhgn1fRW+F48hsrkfzZmGXkdqRqgNTE
 fEg5QXHVvT0Zhd71xgEW+05v32z73h6Eoc2DpUTUb8yKQqhGPHENByE2ORUcfNl9WOcC
 AxRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=W0DKLeXeBCn4HSQPBp6hYRBMjTdyNzAMlLaQA2xi4SA=;
 b=VoUOyhibJ61nUAKFLGXpZv74H7+2a20ZzWqAhHp6wc5N9kL8VlQeaCDy2LS7wrWr03
 PVS3sDnFmQ4USPzoxh9tPVv25EWIAQGz4G5XkeBJmwb+UvybWuEphhaS7MHt5VFpaSMu
 2CpeCR+Q+/0w3KFxwNHwqxJFm1/2K4LZ4cxV5Kjwi5AmL78+Hc0K7yLZtJivj0UQt/jB
 87OSPlnX3WfUzHDUHNFwWBUujI+OvGSYh9itBURwd7xbJX5/94JZviIjBRaqKQfBtJRq
 6DQzIfrEd1hpNHH069Q6txInSLNMJ/hzZn41rnRfGx4eKLeQJm/jI1kFQVgKNpkTO5HM
 956A==
X-Gm-Message-State: APjAAAXbHEi5zQBXcSSFgBA2TxYQQiuiWAfad8TjzebuwZwgHWoqPaK8
 ALb428zIMVB534PnofMVl9GRbPuqMz9jqsPs9baRWQ==
X-Google-Smtp-Source: APXvYqxuSYbqeouE7l1IOuwsKk0VbMkyATIP5PUWPXZnZCJQYH+g13dCyAMh3fQXxwXD28nQSOpz3uASEUy9trauNPg=
X-Received: by 2002:ae9:c206:: with SMTP id j6mr14308398qkg.14.1566788006655; 
 Sun, 25 Aug 2019 19:53:26 -0700 (PDT)
MIME-Version: 1.0
References: <20190824210426.16218-1-katsuhiro@katsuster.net>
 <943932bf-2042-2a69-c705-b8e090e96377@redhat.com>
In-Reply-To: <943932bf-2042-2a69-c705-b8e090e96377@redhat.com>
From: Daniel Drake <drake@endlessm.com>
Date: Mon, 26 Aug 2019 10:53:15 +0800
Message-ID: <CAD8Lp44_uAC4phZ9NbvM_LKNUoiNUqAnFsq4h-bJiQn6byjzGw@mail.gmail.com>
To: Hans de Goede <hdegoede@redhat.com>
Cc: Katsuhiro Suzuki <katsuhiro@katsuster.net>, alsa-devel@alsa-project.org,
 Mark Brown <broonie@kernel.org>, Linux Kernel <linux-kernel@vger.kernel.org>,
 David Yang <yangxiaohua@everest-semi.com>
Subject: Re: [alsa-devel] [PATCH] ASoC: es8316: limit headphone mixer volume
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

T24gTW9uLCBBdWcgMjYsIDIwMTkgYXQgMTozOCBBTSBIYW5zIGRlIEdvZWRlIDxoZGVnb2VkZUBy
ZWRoYXQuY29tPiB3cm90ZToKPiBPbiAyNC0wOC0xOSAyMzowNCwgS2F0c3VoaXJvIFN1enVraSB3
cm90ZToKPiA+IFRoaXMgcGF0Y2ggbGltaXRzIEhlYWRwaG9uZSBtaXhlciB2b2x1bWUgdG8gNCBm
cm9tIDcuCj4gPiBCZWNhdXNlIG91dHB1dCBzb3VuZCBzdWRkZW5seSBiZWNvbWVzIHZlcnkgbG91
ZGx5IHdpdGggbWFueSBub2lzZSBpZgo+ID4gc2V0IHZvbHVtZSBvdmVyIDQuCgpUaGF0IHNvdW5k
cyBsaWtlIHNvbWV0aGluZyB0aGF0IHNob3VsZCBiZSBsaW1pdGVkIGluIFVDTS4KCj4gSGlnaGVy
IHRoZW4gNCBub3Qgd29ya2luZyBtYXRjaGVzIG15IGV4cGVyaWVuY2UsIHNlZSB0aGlzIGNvbW1l
bnQgZnJvbQo+IHRoZSBVQ00gZmlsZTogYWxzYS1saWIvc3JjL2NvbmYvdWNtL2NvZGVjcy9lczgz
MTYvRW5hYmxlU2VxLmNvbmYgOgo+Cj4gIyBTZXQgSFAgbWl4ZXIgdm9sIHRvIC02IGRCICg0Lzcp
IGxvdWRlciBkb2VzIG5vdCB3b3JrCj4gY3NldCAibmFtZT0nSGVhZHBob25lIE1peGVyIFZvbHVt
ZScgNCIKCldoYXQgZG9lcyAiZG9lcyBub3Qgd29yayIgbWVhbiBtb3JlIHByZWNpc2VseT8KCkkg
Y2hlY2tlZCB0aGUgc3BlYywgdGhlcmUgaXMgaW5kZWVkIHNvbWV0aGluZyB3cm9uZyBpbiB0aGUg
a2VybmVsIGRyaXZlciBoZXJlLgpUaGUgZGIgc2NhbGUgaXMgbm90IGEgc2ltcGxlIHNjYWxlIGFz
IHRoZSBrZXJuZWwgc291cmNlIHN1Z2dlc3RzLgoKSW5zdGVhZCBpdCBpczoKMDAwMCDigJMgLTEy
ZEIKMDAwMSDigJMgLTEwLjVkQgowMDEwIOKAkyAtOWRCCjAwMTEg4oCTIC03LjVkQgowMTAwIOKA
kyAtNmRCCjEwMDAg4oCTIC00LjVkQgoxMDAxIOKAkyAtM2RCCjEwMTAg4oCTIC0xLjVkQgoxMDEx
IOKAkyAwZEIKClNvIHBlcmhhcHMgd2UgY2FuIGZpeCB0aGUga2VybmVsIHRvIGZvbGxvdyB0aGlz
IHRhYmxlIGFuZCB0aGVuIHVzZSBVQ00KdG8gbGltaXQgdGhlIHZvbHVtZSBpZiBpdHMgdG9vIGhp
Z2ggb24gYSBnaXZlbiBwbGF0Zm9ybT8KClRoYW5rcwpEYW5pZWwKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KQWxzYS1kZXZlbCBtYWlsaW5nIGxpc3QKQWxz
YS1kZXZlbEBhbHNhLXByb2plY3Qub3JnCmh0dHBzOi8vbWFpbG1hbi5hbHNhLXByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8vYWxzYS1kZXZlbAo=
