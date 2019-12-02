Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 37F7010E524
	for <lists+alsa-devel@lfdr.de>; Mon,  2 Dec 2019 05:47:25 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8D3DE82B;
	Mon,  2 Dec 2019 05:46:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8D3DE82B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1575262044;
	bh=NIdb7Q/wxezJRYKt/foC6/9v8NURknI0axJVYUw67GE=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=G2jcHKt4KtgJRpKZ+40sPNSpeWzl2vYUMf7ydaTZMp1HSnTBDIFPVQD4TRP/wwuPx
	 WgHZwzH/vctaHo70r6G4JfalgkwfshDQnZQBsyNSjUsQL4MZs1a2S8+yyzOnwKEdaB
	 osqzfUB23j/92NDLRe9xlvBkPoiJ0vqdZpjrG6nw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A741DF80214;
	Mon,  2 Dec 2019 05:45:40 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AC9BCF80214; Mon,  2 Dec 2019 05:45:11 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from hqemgate15.nvidia.com (hqemgate15.nvidia.com [216.228.121.64])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 26B00F800B4
 for <alsa-devel@alsa-project.org>; Mon,  2 Dec 2019 05:45:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 26B00F800B4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com
 header.b="oFIUw3+g"
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqemgate15.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5de496c20000>; Sun, 01 Dec 2019 20:44:50 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Sun, 01 Dec 2019 20:44:58 -0800
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Sun, 01 Dec 2019 20:44:58 -0800
Received: from [10.24.218.121] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 2 Dec
 2019 04:44:56 +0000
To: Takashi Iwai <tiwai@suse.de>, Kai Vehmanen <kai.vehmanen@linux.intel.com>
References: <20191129143756.23941-1-kai.vehmanen@linux.intel.com>
 <s5h36e6spxx.wl-tiwai@suse.de>
From: Nikhil Mahale <nmahale@nvidia.com>
Message-ID: <98f586e3-f3e1-81c1-108a-d829457fd8e3@nvidia.com>
Date: Mon, 2 Dec 2019 10:14:53 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <s5h36e6spxx.wl-tiwai@suse.de>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1575261890; bh=qz31yz1o1JXsVTzvJM4xDp9vmEJUBgJZbBi8eIf6/7U=;
 h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
 User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
 X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=oFIUw3+gZzyyzhROfLA7LXy8e7LYb5gWKVD6ck7IOhnlOyvJ1sn/l53ZANBxEYReR
 kGs9QL41BLuxZv/OLnuuN+qSswsDydHDXI9vEgFfoKhnqBN5WOef7bTu/Mjj25OL94
 3R2iWYMckw6sP6TQGhlH5SFcGOTP5PLXwqKWzh+cM5pwrj5KoESVbBsfHJlglDd0DH
 +VYLYYpG3QSbedPOtiPC90fiwDmtIPu4P/Z3VUOO09u8KtC1u1dmIqro94xx2q1WlU
 l8cl3hoUp8OX3B18vpCgRJOIBwFDXmx2yEndNN49Jp37hB5jOqEELFOJMWgyyE3K5D
 F+50OLjP0l+qg==
Cc: alsa-devel@alsa-project.org
Subject: Re: [alsa-devel] [PATCH 1/2] ALSA: hda: hdmi - fix kernel oops
 caused by invalid PCM idx
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

Oh sorry again for this regression, Kai.

Originally my patches were developed with slightly older code which doesn't have your commit 2a2edfbbfee4 (ALSA: hda/hdmi - implement mst_no_extra_pcms flag), when I merge them with tot I did not notice codec->mst_no_extra_pcms mode.

This patch looks good to me.

Thanks,
Nikhil Mahale

On 11/29/19 8:13 PM, Takashi Iwai wrote:
> On Fri, 29 Nov 2019 15:37:55 +0100,
> Kai Vehmanen wrote:
>>
>> Add additional check in hdmi_find_pcm_slot() to not return
>> a pcm index that points to unallocated pcm. This could happen
>> if codec driver is set up in codec->mst_no_extra_pcms mode.
>> On some platforms, this leads to a kernel oops in snd_ctl_notify(),
>> called via update_eld().
>>
>> BugLink: https://github.com/thesofproject/linux/issues/1536
>> Fixes: 5398e94fb753 ALSA: hda - Add DP-MST support for NVIDIA codecs
>> Signed-off-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
> 
> Applied, thanks.
> 
> 
> Takashi
> 

-----------------------------------------------------------------------------------
This email message is for the sole use of the intended recipient(s) and may contain
confidential information.  Any unauthorized review, use, disclosure or distribution
is prohibited.  If you are not the intended recipient, please contact the sender by
reply email and destroy all copies of the original message.
-----------------------------------------------------------------------------------
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
