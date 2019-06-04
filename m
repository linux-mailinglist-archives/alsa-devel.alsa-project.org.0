Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 66F8533EAE
	for <lists+alsa-devel@lfdr.de>; Tue,  4 Jun 2019 08:01:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E41451681;
	Tue,  4 Jun 2019 08:00:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E41451681
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1559628068;
	bh=a56RvxraGDqjGB9zNxmugBNkuttZE5LoWCye6bI19Vg=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YHGUWjbqhNh3PTdFERlZs/Y3gYiJHJeb2k3xpasIgIC6h+HhmD88J1Sege7O49fij
	 ABQOHWbGUw8mnkjfg6ru8TV16UEdSLWCjcOVHIBkL4Gu6Xt8CS2sNEGK6g9kh9Sdlp
	 dDmowAR1Q3wwquHCxQ2mJcC3rliS3xOCAW5dR6/0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2B1F1F89673;
	Tue,  4 Jun 2019 07:59:23 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AAE2CF80054; Tue,  4 Jun 2019 07:59:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 36B61F80054
 for <alsa-devel@alsa-project.org>; Tue,  4 Jun 2019 07:59:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 36B61F80054
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="vEvGKN01"
Received: by mail-wr1-x442.google.com with SMTP id d18so14395405wrs.5
 for <alsa-devel@alsa-project.org>; Mon, 03 Jun 2019 22:59:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent; bh=Jarh7LeGfPu45XYPSBuK6f+8okfPC3JzoLqM+4fRdvo=;
 b=vEvGKN018/l4/qofPxgpuz03Gx/QPZ/zz9kygVUIfCgek99F0lwpmRVHExCKlQ3Wc8
 SFMZ82lJS4sEdpwDFEkYEFeAEkRBAYWKBigHVRrPsX5hNkxe/Z+cL5HVllIX2hRLN7x/
 onfCCFjyD0vzuSDW2yDGywHRQ6hU1bsqFfxOAJdA89pE9QLoN6kB+XW0S9HH/MOZ6P94
 ZayreXbfY3uKs0H+5AOZrah/BoOGh0b7tTLgcoNauK72WVOe55ngmd/lD1Ob+nlVn9Yp
 5AIVSIkp7ALsPR78CD4jY4mopkwOPatH5GLhWqyJREba3XCq3ODg9diPdBncU/T3yvNK
 VrQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=Jarh7LeGfPu45XYPSBuK6f+8okfPC3JzoLqM+4fRdvo=;
 b=pYDN7U3z3cmsTu3ePOUpl+4To8wsvw8B3SvJcg6KaW8rpLaczVLcwB00UkXw73ipcD
 Np6w/CyZiU9nlzgexsvOfPdPdz8EywzK597CeqnKWaPlEFqk/eQJWdmGSolcMJDC1NkY
 W8FSgwzbBB6cpArXOiv7aIg4zjXs729zIA0q/YhE2BtFwp6r4p8eFXQk8hxoVO8PiIcZ
 booPtrUoKJhncJ4bMgrsQhP/GyMX1eoQVZga7avXEtSxBTvTUIBT+sU1h5H985b9R3jl
 YufVzTSUaunOkqMulreHF9zBdwxPedOCw6TgOTNFrMGmiVRUpR0y/PlQc7b9bN1Y5in7
 Daiw==
X-Gm-Message-State: APjAAAWbA8dROJ7d5XDrVNSxcBoKvKvNdkQ4KZTDFhBj67Aqd0QDrPYY
 sU7B0r+yBOUFHJVjeXgqZKGJWQ==
X-Google-Smtp-Source: APXvYqyGn3pYiQrB0R9AEkK3CMobRDAxMJXZBRFJcH4t+l072iVHqtfvkX8LRbZpJoFgIKm6vUBIvQ==
X-Received: by 2002:adf:f041:: with SMTP id t1mr18830108wro.74.1559627958374; 
 Mon, 03 Jun 2019 22:59:18 -0700 (PDT)
Received: from dell ([2.27.167.43])
 by smtp.gmail.com with ESMTPSA id e6sm9199122wrw.83.2019.06.03.22.59.14
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 03 Jun 2019 22:59:17 -0700 (PDT)
Date: Tue, 4 Jun 2019 06:59:08 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Gwendal Grignou <gwendal@chromium.org>
Message-ID: <20190604055908.GA4797@dell>
References: <20190603183401.151408-1-gwendal@chromium.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190603183401.151408-1-gwendal@chromium.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: alsa-devel@alsa-project.org, linux-iio@vger.kernel.org,
 fabien.lahoudere@collabora.com, tiwai@suse.com, linux-kernel@vger.kernel.org,
 groeck@chromium.org, broonie@kernel.org, enric.balletbo@collabora.com,
 bleung@chromium.org, jic23@kernel.org, cychiang@chromium.org
Subject: Re: [alsa-devel] [RESEND PATCH v3 00/30] Update cros_ec_commands.h
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

T24gTW9uLCAwMyBKdW4gMjAxOSwgR3dlbmRhbCBHcmlnbm91IHdyb3RlOgoKPiBUaGUgaW50ZXJm
YWNlIGJldHdlZW4gQ3Jvc0VDIGVtYmVkZGVkIGNvbnRyb2xsZXIgYW5kIHRoZSBob3N0LAo+IGRl
c2NyaWJlZCBieSBjcm9zX2VjX2NvbW1hbmRzLmgsIGFzIGRpdmVyZ2VkIGZyb20gd2hhdCB0aGUg
ZW1iZWRkZWQKPiBjb250cm9sbGVyIHJlYWxseSBzdXBwb3J0Lgo+IAo+IFRoZSBzb3VyY2Ugb2Yg
dGhydXRoIGlzIGF0Cj4gaHR0cHM6Ly9jaHJvbWl1bS5nb29nbGVzb3VyY2UuY29tL2Nocm9taXVt
b3MvcGxhdGZvcm0vZWMvKy9tYXN0ZXIvaW5jbHVkZS9lY19jb21tYW5kcy5oCj4gCj4gVGhhdCBp
bmNsdWRlIGZpbGUgaXMgY29udmVydGVkIHRvIHJlbW92ZSBBQ1BJIGFuZCBFbWJlZGRlZCBvbmx5
IGNvZGUuCj4gCj4gRnJvbSBub3cgb24sIGNyb3NfZWNfY29tbWFuZHMuaCB3aWxsIGJlIGF1dG9t
YXRpY2FsbHkgZ2VuZXJhdGVkIGZyb20KPiB0aGUgZmlsZSBhYm92ZSwgZG8gbm90IG1vZGlmeSBk
aXJlY3RseS4KPiAKPiBGZWxsIGZyZWUgdG8gc3F1YXNoIHRoZSBjb21taXRzIGJlbG93Lgo+IAo+
IHYzIHJlc2VudDogQWRkIEZhYmllbidzIGFjay4KClRoYW5rcyBmb3IgZG9pbmcgdGhhdC4KCklu
IGZ1dHVyZSwgcGxlYXNlIGVuc3VyZSAqLWJ5cyB0YWdzIGFyZSBpbiBjaHJvbm9sb2dpY2FsIG9y
ZGVyIHdpdGgKdGhlIGZpcnN0IG9uZSBlaXRoZXIgYmVpbmcgYSBTdWdnZXN0ZWQtYnkgb3IgeW91
ciBTb0IuICBSZXZpZXdzLCB0ZXN0cwpldGMgdXN1YWxseSBjb21lICphZnRlciogZmlyc3Qgc3Vi
bWlzc2lvbi4KCkkndmUgY2hhbmdlZCB0aGlzIGZvciB5b3UgdGhpcyB0aW1lLCB5ZXMgaW4gYWxs
IDMwIHBhdGNoZXMhICA6KQoKQW55d2F5LCBhbGwgYXBwbGllZCwgdGhhbmtzLgoKLS0gCkxlZSBK
b25lcyBb5p2O55C85pavXQpMaW5hcm8gU2VydmljZXMgVGVjaG5pY2FsIExlYWQKTGluYXJvLm9y
ZyDilIIgT3BlbiBzb3VyY2Ugc29mdHdhcmUgZm9yIEFSTSBTb0NzCkZvbGxvdyBMaW5hcm86IEZh
Y2Vib29rIHwgVHdpdHRlciB8IEJsb2cKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KQWxzYS1kZXZlbCBtYWlsaW5nIGxpc3QKQWxzYS1kZXZlbEBhbHNhLXBy
b2plY3Qub3JnCmh0dHBzOi8vbWFpbG1hbi5hbHNhLXByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8vYWxzYS1kZXZlbAo=
