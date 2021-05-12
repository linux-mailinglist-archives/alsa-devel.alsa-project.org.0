Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 93D3E37D463
	for <lists+alsa-devel@lfdr.de>; Wed, 12 May 2021 23:17:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1CAC641;
	Wed, 12 May 2021 23:16:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1CAC641
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1620854226;
	bh=YmwR9dj99X6orHyH6BslNwI9ZnlbhRgMO4gQzqXM/MY=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cru9D2axMNcRtDSCjs1QJ0/FeBzoaAM+Q8ZC5mdH8FjL2BEWopm2QCQZ+BfaGZ7io
	 HD6/crUCsU9/4wFX1cGoaxS5GRKWSzR0lHDAnhs0J16g5X1wFGCOOIOtbMIMuIB47w
	 0rGEJYAKVX9qcUYcXhfgeDLiATZhJHKkL9eG+1KQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7D18BF8026B;
	Wed, 12 May 2021 23:15:39 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 156F1F80240; Wed, 12 May 2021 23:15:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 65DE7F8013A
 for <alsa-devel@alsa-project.org>; Wed, 12 May 2021 23:15:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 65DE7F8013A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="XU6cC/w7"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 28FA6610A5;
 Wed, 12 May 2021 21:15:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1620854131;
 bh=YmwR9dj99X6orHyH6BslNwI9ZnlbhRgMO4gQzqXM/MY=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=XU6cC/w7uK3f5nudXlv7ecXxvTigHv7NILf0xIIAIT7En584cy2JkXdR8Qg8mL4dh
 Ysq/4WYBS+3MmyHKU48gHmtw+4xVY8J3DF6IiIKbL8vqBOb7dKGsaaQ5FQN7oShbUe
 b3Z9yQZLL8VevSbe0AIbVC8iboq1YeWKqvfmlC6RA0o0m2PiADU3VPf0JCiVYAUg3z
 ILb2qxeEq1g85W0mWqoTQjBEHdS1m7xDNVT5Rnp/T46iKI8rQQnyOJz6TODYWMxRAn
 BLixc1Z9NO0wMcW8/zu9NIY12dvaFdDoyPoBmJbKdOFSuHizmgfXuHZZUGen4+VRWn
 JdD9vDfzSVGFA==
Subject: Re: ASoC: q6dsp: q6afe: remove unneeded dead-store initialization
To: Colin Ian King <colin.king@canonical.com>
References: <5935b287-5b74-84ac-3470-3b71fd69c88c@canonical.com>
From: Nathan Chancellor <nathan@kernel.org>
Message-ID: <7b2d1562-3629-8cd3-d9a7-926c93d20e08@kernel.org>
Date: Wed, 12 May 2021 14:15:28 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <5935b287-5b74-84ac-3470-3b71fd69c88c@canonical.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "Banajit Goswami <bgoswami"@codeaurora.org, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Yang Li <yang.lee@linux.alibaba.com>
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

On 5/12/2021 1:12 PM, Colin Ian King wrote:
> Hi,
> 
> Static analysis with Coverity on linux-next has detected an issue with
> the following commit:
> 
> commit 5f1b95d08de712327e452d082a50fded435ec884
> Author: Yang Li <yang.lee@linux.alibaba.com>
> Date:   Sun Apr 25 18:12:33 2021 +0800
> 
>      ASoC: q6dsp: q6afe: remove unneeded dead-store initialization
> 
> the analysis is as follows:
> 
> 1181 int q6afe_port_stop(struct q6afe_port *port)
> 1182 {
> 1183        struct afe_port_cmd_device_stop *stop;
> 1184        struct q6afe *afe = port->afe;
> 1185        struct apr_pkt *pkt;
> 
>      1. var_decl: Declaring variable port_id without initializer.
> 
> 1186        int port_id;
> 1187        int ret = 0;
> 1188        int index, pkt_size;
> 1189        void *p;
> 1190
> 1191        index = port->token;
> 
>      2. Condition index < 0, taking false branch.
>      3. Condition index >= 127, taking false branch.
> 
> 1192        if (index < 0 || index >= AFE_PORT_MAX) {
> 1193                dev_err(afe->dev, "AFE port index[%d] invalid!\n",
> index);
> 1194                return -EINVAL;
> 1195        }
> 1196
> 1197        pkt_size = APR_HDR_SIZE + sizeof(*stop);
> 1198        p = kzalloc(pkt_size, GFP_KERNEL);
> 
>      4. Condition !p, taking false branch.
> 
> 1199        if (!p)
> 1200                return -ENOMEM;
> 1201
> 1202        pkt = p;
> 1203        stop = p + APR_HDR_SIZE;
> 1204
> 1205        pkt->hdr.hdr_field = APR_HDR_FIELD(APR_MSG_TYPE_SEQ_CMD,
> 1206                                           APR_HDR_LEN(APR_HDR_SIZE),
> 1207                                           APR_PKT_VER);
> 1208        pkt->hdr.pkt_size = pkt_size;
> 1209        pkt->hdr.src_port = 0;
> 1210        pkt->hdr.dest_port = 0;
> 1211        pkt->hdr.token = index;
> 1212        pkt->hdr.opcode = AFE_PORT_CMD_DEVICE_STOP;
> 
>      Uninitialized scalar variable (UNINIT)
>      5. uninit_use: Using uninitialized value port_id.
> 
> 1213        stop->port_id = port_id;
> 1214        stop->reserved = 0;
> 
> the commit removed the initialization of port_id = port->id, and now we
> have a regression where stop->port_id is being assigned with a garbage
> uninitialized value in port_id.  Perhaps the fix needs reverting. As it
> stands, I don't know why clang was reporting this as an error.
> 
> Colin
> 

I suspect this patch was not made against a current tree. I sent a patch 
that resolved this and Mark picked it up so it should be in the next 
-next version:

https://lore.kernel.org/r/20210511190306.2418917-1-nathan@kernel.org/

Cheers,
Nathan
