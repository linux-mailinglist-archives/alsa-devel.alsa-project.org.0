Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A20FC4E7938
	for <lists+alsa-devel@lfdr.de>; Fri, 25 Mar 2022 17:47:20 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3149117A5;
	Fri, 25 Mar 2022 17:46:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3149117A5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1648226840;
	bh=Gv28feZlL1BnEajWf7hvdm/hJ577G5Z3kuUyJleLao0=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Exj1/MowuiBjAzoebXPJysNug3mB+IM69epUfzKGydukld2vtNR6AWIfmqnZJXT8D
	 7bH9sPbOub458H5xO+pEwCwXMj2mlqAMlMfPBE2Gr6b+l71/308s9mrf1VuU7q+TMa
	 6g14XrKMwZr3ZdiQTlLxfaG0Uj51csR/sVUiFre0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B5D07F801F7;
	Fri, 25 Mar 2022 17:46:14 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 88A11F80162; Fri, 25 Mar 2022 17:46:13 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8FA18F80115
 for <alsa-devel@alsa-project.org>; Fri, 25 Mar 2022 17:46:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8FA18F80115
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="XA/37p8S"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 22PChkDC026292;
 Fri, 25 Mar 2022 11:46:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=message-id : date :
 mime-version : subject : to : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=PODMain02222019;
 bh=jGSaY6A5ZfjfM3eHL010kcrsNvS53YZikrY9VvaFlKc=;
 b=XA/37p8SgWdTbuaG1mLWSVSxhYFgWLnQ+tXvIrs7Sb67ea+N/gDF4OsY7C2cJL90tSzu
 uXxMNbYGIrxbeZ3P1M36NJOe+5v6/mdnVKG7+pFbbqKOOOjsOXDVJ/y5AqDHEj5ZJKsH
 gprdE5Zsdj8WfXZQ4U6cYkiIR+bTapXnZKXkIIItsEmlDWoPERfCOnqKnJYI6Gbvzvt5
 Nu/AbtXDNZoe0C8ywoNtHRohBzLOeq+dNc0Hd5l6+10NhNOGtaPv4FDjqU7TBA+e9kjI
 6K/QFslMGCvB+/M2Bk8xLJ117nk8+UKcxC1uM93q5Ychmg7hMbY30MDAdZUpAe9VH0jd QQ== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
 by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3ewbkngmf0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Fri, 25 Mar 2022 11:46:05 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Fri, 25 Mar
 2022 16:46:03 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.18 via
 Frontend Transport; Fri, 25 Mar 2022 16:46:03 +0000
Received: from [198.61.65.125] (unknown [198.61.65.125])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id E7359B10;
 Fri, 25 Mar 2022 16:46:02 +0000 (UTC)
Message-ID: <2ac230dd-36f3-ca70-293a-bfde833d9d0b@opensource.cirrus.com>
Date: Fri, 25 Mar 2022 16:46:02 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 2/2] ASoC: cs35l41: Fix a shift-out-of-bounds warning
 found by UBSAN
Content-Language: en-US
To: Hui Wang <hui.wang@canonical.com>, <alsa-devel@alsa-project.org>,
 <broonie@kernel.org>, <patches@opensource.cirrus.com>,
 <ckeepax@opensource.cirrus.com>
References: <20220324081839.62009-1-hui.wang@canonical.com>
 <20220324081839.62009-2-hui.wang@canonical.com>
From: Lucas tanure <tanureal@opensource.cirrus.com>
In-Reply-To: <20220324081839.62009-2-hui.wang@canonical.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: Es0-Ax706XgmHhh8_1aXV_UISDO91PRY
X-Proofpoint-GUID: Es0-Ax706XgmHhh8_1aXV_UISDO91PRY
X-Proofpoint-Spam-Reason: safe
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

On 3/24/22 08:18, Hui Wang wrote:
> We enabled UBSAN in the ubuntu kernel, and the cs35l41 driver triggers
> a warning calltrace like below:
> 
> cs35l41-hda i2c-CSC3551:00-cs35l41-hda.0: bitoffset= 8, word_offset=23, bit_sum mod 32=0, otp_map[i].size = 24
> cs35l41-hda i2c-CSC3551:00-cs35l41-hda.0: bitoffset= 0, word_offset=24, bit_sum mod 32=24, otp_map[i].size = 0
> ================================================================================
> UBSAN: shift-out-of-bounds in linux-kernel-src/sound/soc/codecs/cs35l41-lib.c:836:8
> shift exponent 64 is too large for 64-bit type 'long unsigned int'
> CPU: 10 PID: 595 Comm: systemd-udevd Not tainted 5.15.0-23-generic #23
> Hardware name: LENOVO \x02MFG_IN_GO/\x02MFG_IN_GO, BIOS N3GET19W (1.00 ) 03/11/2022
> Call Trace:
>   <TASK>
>   show_stack+0x52/0x58
>   dump_stack_lvl+0x4a/0x5f
>   dump_stack+0x10/0x12
>   ubsan_epilogue+0x9/0x45
>   __ubsan_handle_shift_out_of_bounds.cold+0x61/0xef
>   ? regmap_unlock_mutex+0xe/0x10
>   cs35l41_otp_unpack.cold+0x1c6/0x2b2 [snd_soc_cs35l41_lib]
>   cs35l41_hda_probe+0x24f/0x33a [snd_hda_scodec_cs35l41]
>   cs35l41_hda_i2c_probe+0x65/0x90 [snd_hda_scodec_cs35l41_i2c]
> 
> When both bitoffset and otp_map[i].size are 0, the line 836 will
> result in GENMASK(-1, 0), this triggers the shift-out-of-bounds
> calltrace.
> 
> Here add a checking, if both bitoffset and otp_map[i].size are 0,
> do not run GENMASK() and directly set otp_val to 0, this will not
> bring any function change on the driver but could avoid the calltrace.
Here would be better to return an error and fail the probe, as this is
a not expected case.

> 
> Signed-off-by: Hui Wang <hui.wang@canonical.com>
> ---
>   sound/soc/codecs/cs35l41-lib.c | 6 ++++--
>   1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/sound/soc/codecs/cs35l41-lib.c b/sound/soc/codecs/cs35l41-lib.c
> index d0a480c40231..aa6823fbd1a4 100644
> --- a/sound/soc/codecs/cs35l41-lib.c
> +++ b/sound/soc/codecs/cs35l41-lib.c
> @@ -831,12 +831,14 @@ int cs35l41_otp_unpack(struct device *dev, struct regmap *regmap)
>   					GENMASK(bit_offset + otp_map[i].size - 33, 0)) <<
>   					(32 - bit_offset);
>   			bit_offset += otp_map[i].size - 32;
> -		} else {
> +		} else if (bit_offset + otp_map[i].size - 1 >= 0) {
>   			otp_val = (otp_mem[word_offset] &
>   				   GENMASK(bit_offset + otp_map[i].size - 1, bit_offset)
>   				  ) >> bit_offset;
>   			bit_offset += otp_map[i].size;
> -		}
> +		} else /* both bit_offset and otp_map[i].size are 0 */
> +			otp_val = 0;
> +
>   		bit_sum += otp_map[i].size;
>   
>   		if (bit_offset == 32) {

