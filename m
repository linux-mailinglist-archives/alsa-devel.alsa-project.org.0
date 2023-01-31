Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CB6C06835B1
	for <lists+alsa-devel@lfdr.de>; Tue, 31 Jan 2023 19:52:25 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0E8F91F4;
	Tue, 31 Jan 2023 19:51:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0E8F91F4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675191145;
	bh=XBzNqrPKLDVCYB7ZPL+g88+C10SZR/oyAgYW8k1uAuI=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=DFsanHfbtlAsYfnZNBOG7GXWiH62qwddoJcjX+bNy/3ERhZTjeLayoeOZw9UIam0t
	 34PLoMUM/zKuR50aBHNNyLJefhEFzErnZida0CvcEkmoa37qjNoDbwFXJ9vnkPB+CK
	 8CiDAxsxkFpJ4m/D/2kHOopfd3ifEVcfTMjh+A7s=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9CFABF800A7;
	Tue, 31 Jan 2023 19:51:26 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CDCF3F804C2; Tue, 31 Jan 2023 19:51:24 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
 SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 051F0F80169
 for <alsa-devel@alsa-project.org>; Tue, 31 Jan 2023 19:51:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 051F0F80169
Authentication-Results: alsa1.perex.cz; dkim=pass (1024-bit key,
 secure) header.d=perex.cz header.i=@perex.cz header.a=rsa-sha256
 header.s=default header.b=GXZnwlhS
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id BC972400;
 Tue, 31 Jan 2023 19:51:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz BC972400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1675191080; bh=3nzYCZcw7/+jFcY6pwONKDi/Zj110sMOebq8ZsrjNjM=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=GXZnwlhSkswK+mEpgA8fhz/5fjAo+UljjKdsOQUj/76cW3/l1wXao2eYvA2xrWt+k
 9U//imSekCazruTt4GWYc1/fE3xerxyBGTU/Onrv5r+I3dJvg6iMi/3pDyPp9EdIF9
 wW1J9k6z66TOvVwXIioU1XIzpr2Y5pU7LiZE8uj8=
Received: from [192.168.100.98] (unknown [192.168.100.98])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Tue, 31 Jan 2023 19:51:12 +0100 (CET)
Message-ID: <9d61d3c1-c94c-a9c6-2d0d-3368e02e1943@perex.cz>
Date: Tue, 31 Jan 2023 19:51:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v3 0/6] Fix default DMIC gain on AMD PDM drivers
Content-Language: en-US
To: Mario Limonciello <mario.limonciello@amd.com>,
 Jaroslav Kysela <jkysela@redhat.com>,
 Mukunda Vijendar <Vijendar.Mukunda@amd.com>,
 Saba Kareem Syed <Syed.SabaKareem@amd.com>
References: <20230131184653.10216-1-mario.limonciello@amd.com>
From: Jaroslav Kysela <perex@perex.cz>
In-Reply-To: <20230131184653.10216-1-mario.limonciello@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: alsa-devel@alsa-project.org,
 Pananchikkal Renjith <Renjith.Pananchikkal@amd.com>,
 linux-kernel@vger.kernel.org, Mark Pearson <mpearson@lenovo.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On 31. 01. 23 19:46, Mario Limonciello wrote:
> It's been reported that a number of laptops have a low volume
> level from the digital microphone compared to Windows.
> 
> AMD offers a register that can adjust the gain for PDM which is not
> configured at maximum gain by default.
> 
> To fix this change the default for all 3 drivers to raise the gain
> but also offer a module parameter. The module parameter can be used
> for debugging if the gain is too high on a given laptop.
> 
> This is intentionally split into multiple patches for default and
> parameter so that if the default really does behave better universally
> we can bring it back to stable too later.
> 
> v2->v3:
>   * Use clamp and clear properly
> 
> Mario Limonciello (6):
>    ASoC: amd: yc: Adjust the gain for PDM DMIC
>    ASoC: amd: yc: Add a module parameter to influence pdm_gain
>    ASoC: amd: renoir: Adjust the gain for PDM DMIC
>    ASoC: amd: renoir: Add a module parameter to influence pdm_gain
>    ASoC: amd: ps: Adjust the gain for PDM DMIC
>    ASoC: amd: ps: Add a module parameter to influence pdm_gain

For all patches:

Reviewed-by: Jaroslav Kysela <perex@perex.cz>

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.

