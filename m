Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C8ADE336BB1
	for <lists+alsa-devel@lfdr.de>; Thu, 11 Mar 2021 06:34:40 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 60C50172B;
	Thu, 11 Mar 2021 06:33:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 60C50172B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1615440880;
	bh=Xf+vHqzFYGcganuFL+xw7fOewWwmVbt71lIpvz1I1Kc=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ZJ86Uct4AcgthaCQWO/6oSYtrkGm09cWcdCeiu3ojxBvjj3mzX84F9atg4UpHsq+b
	 8Hf3qFiOdQIPSI5Ji+yBDVVm3ReKYFpEgORz/86kteA75UqyB9ZLK7SNOEFCEBWLiE
	 dqCE8UqNSJIYkAkw6GPcrHZ7xTEzNUiM3mDVcthA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 233B2F80227;
	Thu, 11 Mar 2021 06:33:10 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4A51EF8019B; Thu, 11 Mar 2021 06:33:07 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B6CBDF8010D
 for <alsa-devel@alsa-project.org>; Thu, 11 Mar 2021 06:32:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B6CBDF8010D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="fI2tQqtz"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="vzPGl1Tj"
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 3BA732BE6;
 Thu, 11 Mar 2021 00:32:57 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Thu, 11 Mar 2021 00:32:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=WELcPkyp0D/X6z6TD3moVYvlq8G
 mMGEk61DZECXTymg=; b=fI2tQqtzHQzVkqw8XsP3zU6OUXseLmmtCwzDofy8Gr8
 zeMbPhtUVTaGkMqOFgW13NPTcB7pli17bRh4ru2hfdbn46YHUAXaVaH3GgV99Xi7
 vLe8vj/5D86B76hWO2q7kzQWvw8SbuhCvW90ZFNjsi9GJzCwMMOCSbRYty+JxmFH
 w8aAFdm8uDKKDWVlD7jgggQdU6lsG0SPTy8nIhkkwyYGYJ4ULWCMMBJUIwldDIit
 3cJuzX32llHNynLgMuHlpf5yDDvAEOGIvTu0JipzABiZNN7QSEQjND8usZxLh9DH
 fM56uMuRZk9exmgpYI2LZqwpC1YH81BYpoOF1QEAX3Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=WELcPk
 yp0D/X6z6TD3moVYvlq8GmMGEk61DZECXTymg=; b=vzPGl1Tjd7uBTH5525EDdt
 10paz5vnV+yZVVsgoMgguWLJs/4+xIVnThCxkiblFeYCYQ6vf65kwpm1hEhf+5JL
 +sPg+wkXZDC29S14DyHGoj8MESv/UJcI9teBAWPNLMPHfr0dK9fT/8h2vqI6GQky
 TrsFNmwN9K5fkmIUjjsP0uOynIInBGCNk/CysGQNwnE0PPHlUco/HIfu64EU3SVP
 aEtu2nT3G3b0Tkg4vJ4BiPnoqhHeel/AQwR5QG1UkJQ7djX70LugGSwxaR9uAgq9
 H7SpeFFDe1vtiRGmXerFXxUXMetEiTJTxAOLeGHoBrL7p0jvCjM0NnS4jeo3liuw
 ==
X-ME-Sender: <xms:h6tJYFC4gpmSxIPKBD1DfsC7Va4FmsqCDlZLqZt_rDyzoOLwxE4zVg>
 <xme:h6tJYDh29l-x1iwmGy3az6mNqnUhVdnSnAyl5cDlgOBcxgAVr_QB2rgBbroFSG7VU
 WVCQwV5FEzK-zA-oQc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudduledgkeegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpeffhffvuffkfhggtggujgesthdtre
 dttddtvdenucfhrhhomhepvfgrkhgrshhhihcuufgrkhgrmhhothhouceoohdqthgrkhgr
 shhhihesshgrkhgrmhhotggthhhirdhjpheqnecuggftrfgrthhtvghrnheplefhueegvd
 ejgfejgfdukeefudetvddtuddtueeivedttdegteejkedvfeegfefhnecukfhppedugedr
 fedrieehrddujeehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilh
 hfrhhomhepohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhirdhjph
X-ME-Proxy: <xmx:h6tJYAn-Js3eHLQIa0rGAD4tXvMJgFkEPRG7ph1jLyi7pbGyjgBDIw>
 <xmx:h6tJYPyrBaV-9Vgn7JFdcFfee7UN_orook-SChWPL2f3cDWm7svSZQ>
 <xmx:h6tJYKRmgqwvObmT1mZl0WvvM9C0T67vDY8C1MZOCDRK_x1R5b1uFQ>
 <xmx:iKtJYD5zaCD9DnVxY6A3AeHbZow-097XMGN6r6MH2WSw_2MP0BHQww>
Received: from workstation (ae065175.dynamic.ppp.asahi-net.or.jp [14.3.65.175])
 by mail.messagingengine.com (Postfix) with ESMTPA id 8D4D5240054;
 Thu, 11 Mar 2021 00:32:54 -0500 (EST)
Date: Thu, 11 Mar 2021 14:32:52 +0900
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: tiwai@suse.de, perex@perex.cz
Subject: Re: [alsa-utils][PATCH 13/13] Revert "axfer: test - add
 run-test-in-tmpdir.sh script"
Message-ID: <20210311053252.GA404126@workstation>
Mail-Followup-To: tiwai@suse.de, perex@perex.cz,
	alsa-devel@alsa-project.org
References: <20210311052146.404003-1-o-takashi@sakamocchi.jp>
 <20210311052146.404003-14-o-takashi@sakamocchi.jp>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210311052146.404003-14-o-takashi@sakamocchi.jp>
Cc: alsa-devel@alsa-project.org
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

Oops. I missed delete this old-versioned patch. Please abandon this
when applying the others.


Regards

Takashi Sakamoto

On Thu, Mar 11, 2021 at 02:21:44PM +0900, Takashi Sakamoto wrote:
> This reverts commit e1551de8dd28c3a63f8d7c146952a8d2649ac9de since tests
> run for in-memory files now.
> 
> Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
> ---
>  axfer/test/run-test-in-tmpdir.sh | 19 -------------------
>  1 file changed, 19 deletions(-)
>  delete mode 100755 axfer/test/run-test-in-tmpdir.sh
> 
> diff --git a/axfer/test/run-test-in-tmpdir.sh b/axfer/test/run-test-in-tmpdir.sh
> deleted file mode 100755
> index e66fa73..0000000
> --- a/axfer/test/run-test-in-tmpdir.sh
> +++ /dev/null
> @@ -1,19 +0,0 @@
> -#!/bin/sh
> -
> -bin="$1"
> -
> -test -z ${bin} && exit 90
> -test ! -x ${bin} && exit 91
> -test -z ${TMPDIR} && exit 92
> -test ! -d ${TMPDIR} && exit 93
> -
> -tmp_dir=$(mktemp -d ${TMPDIR}/container-test.XXXXX)
> -cur_dir=$(pwd)
> -
> -echo ${tmp_dir}
> -cd ${tmp_dir}
> -${cur_dir}/${bin}
> -retval=$?
> -cd ${cur_dir}
> -rm -rf ${tmp_dir}
> -exit $retval
> -- 
> 2.27.0
> 
