Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EA78EC33D3
	for <lists+alsa-devel@lfdr.de>; Tue,  1 Oct 2019 14:06:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7002516C5;
	Tue,  1 Oct 2019 14:05:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7002516C5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1569931570;
	bh=Im2bXzWS//PNUQ/zaJPXPEkN7PfpQ1TNBMmQ0t/+JxA=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=uDGdygfaKFrB2SDFp6A0ckuxPXKFK/dz5Xr1F24EIyKGNNY4To99O4poerafqRRLn
	 jFYHe6+mYuhwjeXt0poA/UFblkaUPvBxkHKOhhpCJdOqg6SUh0ykM8krLL2sJMSWII
	 QsQlCil0S9mv44i1qHRFdmgmiLW+LnI7wkpwjNkw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 107CCF80611;
	Tue,  1 Oct 2019 14:00:29 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 58D2DF8060F; Tue,  1 Oct 2019 14:00:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8DBB6F804FF
 for <alsa-devel@alsa-project.org>; Tue,  1 Oct 2019 14:00:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8DBB6F804FF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="J5Hcxqc6"
Received: by mail-wr1-x443.google.com with SMTP id h7so15168711wrw.8
 for <alsa-devel@alsa-project.org>; Tue, 01 Oct 2019 05:00:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent; bh=cX58GGACbtrolGnd+9mQWdHIaAk/EA5heJpdGs+Z5xE=;
 b=J5Hcxqc6va3RD4CAhadBwUzrMU6yN/sHECz7MCwAgEwWB+Anlnnp3zu+G87CDgK1Jb
 1q3ZhMI0w6Q4jrEHyKsrtV8HgSW3roCzlKr8HJbl66Tojau2T69eNrCVLXmaT/Pxs8qg
 0AyO/HTM4pb6VDTonRpHGzevuxV1QSnLtbWDg7d9jIBysbnn7P9Dja4/IVYEI1WF4JDB
 5nMWgSgyhUln2kThGKs3PapKsqGJlWQltaqfunHfBmU2iBUfbhoQLhWOxADhfQt2Wxov
 HpTHXaqvdr9fNQNlGs529fiVtFvtxdnYRFYIeLeHdyrblyH3tq0qNya119frj63U9hE7
 kvOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=cX58GGACbtrolGnd+9mQWdHIaAk/EA5heJpdGs+Z5xE=;
 b=VAHa5wsGeCuoHCkY3wM4UarfrE0VEDJ7xX2hmWpxkpFgvnS+BXKcmqc3FskfIMFS2M
 VdbR44VqJsl7RjAEPF/blEktqJoublLJfhC1rv2UgPqBCv7MV4HuY0HS2uGkPML0r4s7
 YiHhxctLG6ramhDY/PHpeNVnWtvBn6FouHtFDi0hFAVGQ52kALQLpiQyGitJ29KKQNI2
 sfrZOtsupvNwWy3jQ2HRyqEyLJ9QgnpY36PG5qlBRTopqAQSpa+i24A7LsjDXdiuXneX
 GwiROLt0oSqSxty8GCcp5zgoUNZl1oEFse/PJ9BshdvQhheEBZaON9krR1ExxF+ba85r
 0i9w==
X-Gm-Message-State: APjAAAUO3+wLOTw+brkPQgNrHkwVUJyxvJqEgwUk9EfSYZ+o4OK2Iedz
 YakUv/FobAtmq0IvxsgydvTHcw==
X-Google-Smtp-Source: APXvYqwITNLfh4KoCqzJsE/cZlnld6OeSRg9Cn+FjjCeden2TyBIwPP2jxHWZzGoQuKeM3jwaX7gfQ==
X-Received: by 2002:a5d:44d2:: with SMTP id z18mr1493824wrr.122.1569931222387; 
 Tue, 01 Oct 2019 05:00:22 -0700 (PDT)
Received: from dell ([2.27.167.122])
 by smtp.gmail.com with ESMTPSA id a7sm32966282wra.43.2019.10.01.05.00.21
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 01 Oct 2019 05:00:21 -0700 (PDT)
Date: Tue, 1 Oct 2019 13:00:20 +0100
From: Lee Jones <lee.jones@linaro.org>
To: vishnu <vravulap@amd.com>
Message-ID: <20191001120020.GC11769@dell>
References: <1569891524-18875-1-git-send-email-Vishnuvardhanrao.Ravulapati@amd.com>
 <1569891524-18875-2-git-send-email-Vishnuvardhanrao.Ravulapati@amd.com>
 <20191001064539.GB11769@dell>
 <2ff13a61-a346-4d49-ab3a-da5d2126727c@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <2ff13a61-a346-4d49-ab3a-da5d2126727c@amd.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: "moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
 <alsa-devel@alsa-project.org>,
 Maruthi Srinivas Bayyavarapu <Maruthi.Bayyavarapu@amd.com>,
 open list <linux-kernel@vger.kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, "Mehta, Sanju" <Sanju.Mehta@amd.com>,
 "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 Mark Brown <broonie@kernel.org>, "Mukunda,
 Vijendar" <Vijendar.Mukunda@amd.com>, "RAVULAPATI,
 VISHNU VARDHAN RAO" <Vishnuvardhanrao.Ravulapati@amd.com>,
 Colin Ian King <colin.king@canonical.com>,
 Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [alsa-devel] [PATCH 2/7] ASoC: amd: Registering device
 endpoints using MFD framework
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

T24gVHVlLCAwMSBPY3QgMjAxOSwgdmlzaG51IHdyb3RlOgoKPiBIaSBKb25lcywKPiAKPiBJIGFt
IHZlcnkgVGhhbmtmdWwgdG8geW91ciByZXZpZXcgY29tbWVudHMuCj4gCj4gQWN0dWFsbHkgVGhl
IGRyaXZlciBpcyBub3QgdG90YWxseSBiYXNlZCBvbiBNRkQuIEl0IGp1c3QgdXNlcyAKPiBtZmRf
YWRkX2hvdHBsdWdfZGV2aWNlcygpIGFuZCBtZmRfcmVtb3ZlX2RldmljZXMoKSBmb3IgYWRkaW5n
IHRoZSAKPiBkZXZpY2VzIGF1dG9tYXRpY2FsbHkuCj4gCj4gUmVtYWluaW5nIGNvZGUgaGFzIG5v
dGhpbmcgdG8gZG8gd2l0aCBNRkQgZnJhbWV3b3JrLgo+IAo+IFNvIEkgdGhvdWdodCBJdCB3b3Vs
ZCBub3QgYnJlYWsgdGhlIGNvZGluZyBzdHlsZSBhbmQgbW92ZWQgYWhlYWQgYnkgCj4gdXNpbmcg
dGhlIE1GRCBBUEkgYnkgYWRkaW5nIGl0cyBoZWFkZXIgZmlsZS4KPiAKPiBJZiBpdCBpcyBhbnkg
dmlvbGF0aW9uIG9mIGNvZGluZyBzdGFuZGFyZCB0aGVuIEkgY2FuIG1vdmUgaXQgdG8gCj4gZHJp
dmVycy9tZmQuCj4gCj4gVGhpcyBwYXRjaCBjb3VsZCBiZSBhIHNob3cgc3RvcHBlciBmb3IgdXMu
UGxlYXNlIHN1Z2dlc3QgdXMgaG93IGNhbiB3ZSAKPiBtb3ZlIGFoZWFkIEFTQVAuCgpFaXRoZXIg
bW92ZSB0aGUgTUZEIHBhcnRzIHRvIGRyaXZlcnMvbWZkLCBvciBzdG9wIHVzaW5nIHRoZSBNRkQg
QVBJLgoKLS0gCkxlZSBKb25lcyBb5p2O55C85pavXQpMaW5hcm8gU2VydmljZXMgVGVjaG5pY2Fs
IExlYWQKTGluYXJvLm9yZyDilIIgT3BlbiBzb3VyY2Ugc29mdHdhcmUgZm9yIEFSTSBTb0NzCkZv
bGxvdyBMaW5hcm86IEZhY2Vib29rIHwgVHdpdHRlciB8IEJsb2cKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KQWxzYS1kZXZlbCBtYWlsaW5nIGxpc3QKQWxz
YS1kZXZlbEBhbHNhLXByb2plY3Qub3JnCmh0dHBzOi8vbWFpbG1hbi5hbHNhLXByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8vYWxzYS1kZXZlbAo=
