Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 175667038F
	for <lists+alsa-devel@lfdr.de>; Mon, 22 Jul 2019 17:21:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7F9C717D8;
	Mon, 22 Jul 2019 17:20:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7F9C717D8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1563808865;
	bh=34IgMI/vNnRAtlViuTLMHTYYy7KmjbX+bNH1ejeJT2o=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YRR9+TcF7XMigDSVf5vHvIGPm0HySzgTdkgIJJHzolBsM7mXJqROBnculVO3ElY7B
	 vLuHJADYgFR1Yt2hYueXdi9ir2Ax5eDyUN5yhrutcTScggkXSpzBx4tpmFdWFd/eWN
	 uCS2kSLAtNZlDsPq3Awk5dUb3e0ZOhAIqZa4IjgY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 08205F803D1;
	Mon, 22 Jul 2019 17:20:02 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6AE98F803D6; Mon, 22 Jul 2019 17:19:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=PRX_BODY_30,
 RCVD_IN_DNSWL_BLOCKED, SPF_HELO_NONE, SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 84278F800F5
 for <alsa-devel@alsa-project.org>; Mon, 22 Jul 2019 17:19:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 84278F800F5
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 22 Jul 2019 08:19:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,295,1559545200"; d="scan'208";a="177015340"
Received: from agalla-mobl1.amr.corp.intel.com (HELO [10.254.103.46])
 ([10.254.103.46])
 by FMSMGA003.fm.intel.com with ESMTP; 22 Jul 2019 08:19:53 -0700
To: Arnd Bergmann <arnd@arndb.de>,
 Masahiro Yamada <yamada.masahiro@socionext.com>
References: <20190721142308.30306-1-yamada.masahiro@socionext.com>
 <CAK8P3a01MzCTJnk_fuMgWsRBa3u_CEZegZqH37G7qLiquHWncA@mail.gmail.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <fdd24e93-efad-0132-e1ff-b7f5f87e8efc@linux.intel.com>
Date: Mon, 22 Jul 2019 10:19:53 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAK8P3a01MzCTJnk_fuMgWsRBa3u_CEZegZqH37G7qLiquHWncA@mail.gmail.com>
Content-Language: en-US
Cc: ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Takashi Iwai <tiwai@suse.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Mark Brown <broonie@kernel.org>
Subject: Re: [alsa-devel] [PATCH] ASoC: SOF: use __u32 instead of uint32_t
 in uapi headers
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>



On 7/22/19 8:39 AM, Arnd Bergmann wrote:
> On Sun, Jul 21, 2019 at 4:25 PM Masahiro Yamada
> <yamada.masahiro@socionext.com> wrote:
>>
>>   struct snd_sof_blk_hdr {
>>          enum snd_sof_fw_blk_type type;
>> -       uint32_t size;          /* bytes minus this header */
>> -       uint32_t offset;        /* offset from base */
>> +       __u32 size;             /* bytes minus this header */
>> +       __u32 offset;           /* offset from base */
>>   } __packed;
>>
> 
> On a related note: Using an 'enum' in an ABI structure is not portable
> across architectures. This is probably fine in a UAPI as long as user
> and kernel space agree on the size of an enum, but if the same
> structure is used to talk to the firmware, it won't work on architectures
> that have a different size for the first field.

yes, we've removed all enums in SOF and missed this one. This should be 
changed, thanks for the note.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
