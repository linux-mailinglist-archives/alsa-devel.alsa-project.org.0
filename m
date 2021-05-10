Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EB7637916F
	for <lists+alsa-devel@lfdr.de>; Mon, 10 May 2021 16:54:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1F417177F;
	Mon, 10 May 2021 16:53:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1F417177F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1620658446;
	bh=wJGDBCy7G4K06I/M5MTsqGKM12rGU7ygq2h/JgJYnWQ=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BT+qrSnw4tIUaJ/bvk5JVfhQxSEJ5xGeO+X0LVB6mfa7bTdES7TW+tfNnLWpOCKVo
	 P34Os+4JTKxPgcyeGSfgAdtcNZowpzUAmSKvvQOdGTIiI2v0GTpsUyqSjQXwV7mw6J
	 b1ZR7ELnczGhhGzNSwqPemjSOXXZ4YjyUUH2t8T8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8D729F804CF;
	Mon, 10 May 2021 16:50:11 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 21D9FF80272; Mon, 10 May 2021 15:16:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 70F22F800EA
 for <alsa-devel@alsa-project.org>; Mon, 10 May 2021 15:16:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 70F22F800EA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="GfQpYA/u"
Received: by mail-wm1-x330.google.com with SMTP id
 s5-20020a7bc0c50000b0290147d0c21c51so8864649wmh.4
 for <alsa-devel@alsa-project.org>; Mon, 10 May 2021 06:16:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Sh4i9feljTPFrIfpR/IU/E8n0D3Fda88xyQfypmum7w=;
 b=GfQpYA/u/ESXNzCwhJN35I1L0Sb2vRVeukRNG83W8xG2OMlDA6+i5W0OODo/+LWE9E
 ivWW5//Dci3M+PXPgJnH/odM7KtTO7yjQKrEe7KAvh4E7fvrd/ZuLkJAZP62sWtsDMuB
 AIqgCRqoTLZzj0iGC6/REa3QuGlmZjiRxifV0mZYrMLJSap8JjiujnvbMmFTzTlx+O95
 x9XnwiLNDr5qqWcsdoyW+ETG1hWAlzA+FW12aKJEwh2j5DlnppfpjkE6ahf9DAyZ8V+v
 c4HLN0tsaWZM2+zfMzrOFU3u/mXI98pyg6LlDYSgFBtDuHlk1DmX0lhge4HX1KOLhtwA
 z+4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Sh4i9feljTPFrIfpR/IU/E8n0D3Fda88xyQfypmum7w=;
 b=Ygpf84i2BvKAqk6S3sQCiUh4RxpvLPDvFvind315os3kc/MlT067oQcbigee7oakH3
 1VzwRH7BDDK81yUlRbXCJAMfRdFVD6XZNVxiyKRPCIY4nrShDpA/CxfRBRR+CQtQWAaj
 CFc5ichOHZMR/VNqOXf5/HjOJENUvZih9McfkTNqkbuYDpPbnqB4sMOg37rGR16VBMm4
 cv+yMtwyr6gFDCS/i2n0QqrQys++YU/YETS20/8drQRaMa+ocm24h4NlCCG1p0ywhQGe
 ImrYas7MhCZ7dkAkNddiUONic8fsojqsZHG151ybAx5Tasv3WOcnYXuSa4MA1QzDdHTi
 XlKQ==
X-Gm-Message-State: AOAM531XWuOUqUIaudAxVVefOPUiT+2BOUlP+4OSNrs1az6dJ5ScEYeV
 Bvr24A0Cvqhyfpj18m4Dd7Q=
X-Google-Smtp-Source: ABdhPJysoQ4YBpE1J87NsTC/Z24p8NQqGLKPSudpVCmtLwZFhM2Wy0R7/k0aKiXMKdpTI23nPdYVEw==
X-Received: by 2002:a05:600c:47d7:: with SMTP id
 l23mr36980376wmo.95.1620652578722; 
 Mon, 10 May 2021 06:16:18 -0700 (PDT)
Received: from [192.168.1.122]
 (cpc159425-cmbg20-2-0-cust403.5-4.cable.virginm.net. [86.7.189.148])
 by smtp.gmail.com with ESMTPSA id s1sm27945073wmj.8.2021.05.10.06.16.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 May 2021 06:16:17 -0700 (PDT)
Subject: Re: [PATCH 00/53] Get rid of UTF-8 chars that can be mapped as ASCII
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 David Woodhouse <dwmw2@infradead.org>
References: <cover.1620641727.git.mchehab+huawei@kernel.org>
 <2ae366fdff4bd5910a2270823e8da70521c859af.camel@infradead.org>
 <20210510135518.305cc03d@coco.lan>
From: Edward Cree <ecree.xilinx@gmail.com>
Message-ID: <df6b4567-030c-a480-c5a6-fe579830e8c0@gmail.com>
Date: Mon, 10 May 2021 14:16:16 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20210510135518.305cc03d@coco.lan>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 10 May 2021 16:50:04 +0200
Cc: alsa-devel@alsa-project.org, kvm@vger.kernel.org,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>, linux-iio@vger.kernel.org,
 linux-pci@vger.kernel.org, linux-fpga@vger.kernel.org,
 dri-devel@lists.freedesktop.org, keyrings@vger.kernel.org,
 linux-riscv@lists.infradead.org, Jonathan Corbet <corbet@lwn.net>,
 linux-rdma@vger.kernel.org, x86@kernel.org, linux-acpi@vger.kernel.org,
 intel-wired-lan@lists.osuosl.org, linux-input@vger.kernel.org,
 linux-ext4@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 linux-media@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-sgx@vger.kernel.org, coresight@lists.linaro.org, rcu@vger.kernel.org,
 mjpeg-users@lists.sourceforge.net, linux-arm-kernel@lists.infradead.org,
 linux-edac@vger.kernel.org, linux-hwmon@vger.kernel.org,
 netdev@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-integrity@vger.kernel.org
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

On 10/05/2021 12:55, Mauro Carvalho Chehab wrote:
> The main point on this series is to replace just the occurrences
> where ASCII represents the symbol equally well

> 	- U+2014 ('—'): EM DASH
Em dash is not the same thing as hyphen-minus, and the latter does not
 serve 'equally well'.  People use em dashes because — even in
 monospace fonts — they make text easier to read and comprehend, when
 used correctly.
I accept that some of the other distinctions — like en dashes — are
 needlessly pedantic (though I don't doubt there is someone out there
 who will gladly defend them with the same fervour with which I argue
 for the em dash) and I wouldn't take the trouble to use them myself;
 but I think there is a reasonable assumption that when someone goes
 to the effort of using a Unicode punctuation mark that is semantic
 (rather than merely typographical), they probably had a reason for
 doing so.

> 	- U+2018 ('‘'): LEFT SINGLE QUOTATION MARK
> 	- U+2019 ('’'): RIGHT SINGLE QUOTATION MARK
> 	- U+201c ('“'): LEFT DOUBLE QUOTATION MARK
> 	- U+201d ('”'): RIGHT DOUBLE QUOTATION MARK
(These are purely typographic, I have no problem with dumping them.)

> 	- U+00d7 ('×'): MULTIPLICATION SIGN
Presumably this is appearing in mathematical formulae, in which case
 changing it to 'x' loses semantic information.

> Using the above symbols will just trick tools like grep for no good
> reason.
NBSP, sure.  That one's probably an artefact of some document format
 conversion somewhere along the line, anyway.
But what kinds of things with × or — in are going to be grept for?

If there are em dashes lying around that semantically _should_ be
 hyphen-minus (one of your patches I've seen, for instance, fixes an
 *en* dash moonlighting as the option character in an `ethtool`
 command line), then sure, convert them.
But any time someone is using a Unicode character to *express
 semantics*, even if you happen to think the semantic distinction
 involved is a pedantic or unimportant one, I think you need an
 explicit grep case to justify ASCIIfying it.

-ed
