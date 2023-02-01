Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D58E6687059
	for <lists+alsa-devel@lfdr.de>; Wed,  1 Feb 2023 22:07:55 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 12F2B91;
	Wed,  1 Feb 2023 22:07:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 12F2B91
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675285675;
	bh=iRKnL0h2vDqLOR7wwetQc+wVcIvEQsrF0Mp7+5R7hA4=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=BHfXRgdzODWS3g0Kq7IGAmJGPa5xXjLUDX6tHccCoA+vvpcF1cDJAZ87yNlbZYyPL
	 HtcVZRhFE0S/JynXpfSEiW4ZfCSjROaQ5ds4Zq72COHrD5uV2PA2l2WJStQh0YwPGe
	 uz1bOPyn+JcdMSFuMmetQVR3tZQNxdMkN/eFzzoA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1B249F80155;
	Wed,  1 Feb 2023 22:06:54 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4B8FAF80423; Wed,  1 Feb 2023 22:06:52 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
 SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from esa2.hgst.iphmx.com (esa2.hgst.iphmx.com [68.232.143.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 03E6AF80155
 for <alsa-devel@alsa-project.org>; Wed,  1 Feb 2023 22:06:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 03E6AF80155
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key, unprotected) header.d=wdc.com header.i=@wdc.com
 header.a=rsa-sha256 header.s=dkim.wdc.com header.b=Yw90Ep8l; 
 dkim=pass (2048-bit key,
 unprotected) header.d=opensource.wdc.com header.i=@opensource.wdc.com
 header.a=rsa-sha256 header.s=dkim header.b=V8ZS818B
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1675285601; x=1706821601;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=iRKnL0h2vDqLOR7wwetQc+wVcIvEQsrF0Mp7+5R7hA4=;
 b=Yw90Ep8lppjZVhvd40NR18aPlxYQ6PmQG6Vvm/knzM117FgoabZuyu+m
 7PFXByJ2jX11rbTJ5XyVUG41Ltw3nuDN9Va8TO2MjbvY6kiJ+UJNeDWOp
 6gdOwMdixH6p2IYrqeKxsV6p0oxAJkWzwxLIrv9fAnBzIkxqHbHEiPDEI
 eLVdkd7usyzdyEou2rWnYmx7IitEJlanpxm8h76wRroD6tvp8wsK6Rq5A
 pUMq0R2EK9yP4IWU0CyiOGaP+ta7JQ+tIC0/hJQcpP3CKhQSowrEQvTKO
 AMJku3lLtiLXZOPghRDlB2BKPmKyiia5uxasi9ZqiLL29ZrAGyBQa/Pe4 Q==;
X-IronPort-AV: E=Sophos;i="5.97,265,1669046400"; d="scan'208";a="326598428"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 02 Feb 2023 05:06:29 +0800
IronPort-SDR: 3tQMIRbpkYEtPELahjbt/UgpIxtx3sZ1qdwAZL3ec9WQ0n6DNq5ebTORzOIsbI/76ciHAps6Wx
 DtNoIYfBsXdxmcoUclKsqBBkt1NnmXyE4+hxPIt9EqV5U0LUT65s2V6NQ70Hy1H53/BvbFTmpX
 7/XTpxzGuSZ8ZPydktOwT+N4Ma4P4ookrSuUvBmksGqBIMGfK5OHCSKjqzXdPENOSeqS1fhcbY
 GwQE2g1N/5XQ88RXx+u647/MmjKH144zmf6aLz7DITnAY0/Q60CtZ14cqKuEtY7Hq/uV6QZawn
 lys=
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 01 Feb 2023 12:18:08 -0800
IronPort-SDR: HsVGArOQMMhKreSy8Iihvc8vLmA3IObI4E4mhBZKdW7u3PIk5Scko3IFyiiE6+2yKGHy1Oo0t9
 9YkdbGHvLMyfLVxuhfHd5G2Jwd5TFD8G7gbWSsD/YjNZC/GlYqmK9LNW1yL7OsFgykrslup401
 5S7/5gHPakC+3gmVg/fmWzFzlRk2cy3uyNHSbic2id9WuXg5SwL9yLxJNbjy1YJKOUNNBbz0sz
 z5sdT8dtf+zKpUENOVSz/lRh9u6FVqQe+ATndvZvCTD6WBB1idnl2vaNaGW4DgNviulsZnkp63
 3yc=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 01 Feb 2023 13:06:29 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4P6ZGY0cq9z1RvTp
 for <alsa-devel@alsa-project.org>; Wed,  1 Feb 2023 13:06:29 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:content-type
 :in-reply-to:organization:from:references:to:content-language
 :subject:user-agent:mime-version:date:message-id; s=dkim; t=
 1675285588; x=1677877589; bh=iRKnL0h2vDqLOR7wwetQc+wVcIvEQsrF0Mp
 7+5R7hA4=; b=V8ZS818BsRUL1nCwybqdEYTe8Wx0WBi6qOXAxFoZKbXfCBwwWFf
 VOosxalLJs4cfWKySVQbx1ZrLB5YonTFBaoj/OLDVfT8cUBJ8bD5tiSE5hzQ46RF
 TEakRsy3ipmA2B41lBPZ393WOLeL83l8wWtcOnR/4nSLayBR+cXU60TKUAZZkqU3
 m9id8XIALxEB+iWm2k7m3TXJnm913IifTzv30TSMO2LexFx2Yy+QwW5uL0PLMTEh
 vHlfWflhhZbCIVwDj00GWrUNQ6CJKTuSmUOhYwjGnWlId5TVTF+fr24Bl74RV9QG
 GmSDm/bX8s7qZ+Mjsw8eY/3NXzRSKvHjbdA==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026)
 with ESMTP id WUeuaLStLhp0 for <alsa-devel@alsa-project.org>;
 Wed,  1 Feb 2023 13:06:28 -0800 (PST)
Received: from [10.225.163.79] (unknown [10.225.163.79])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4P6ZGV4bwJz1RvLy;
 Wed,  1 Feb 2023 13:06:26 -0800 (PST)
Message-ID: <7cf17a27-13dc-e6b4-c34c-47454239af30@opensource.wdc.com>
Date: Thu, 2 Feb 2023 06:06:25 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v3] powerpc: macio: Make remove callback of macio driver
 void returned
Content-Language: en-US
To: Dawei Li <set_pte_at@outlook.com>, mpe@ellerman.id.au
References: <TYCP286MB232391520CB471E7C8D6EA84CAD19@TYCP286MB2323.JPNP286.PROD.OUTLOOK.COM>
From: Damien Le Moal <damien.lemoal@opensource.wdc.com>
Organization: Western Digital Research
In-Reply-To: <TYCP286MB232391520CB471E7C8D6EA84CAD19@TYCP286MB2323.JPNP286.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset=UTF-8
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
Cc: alsa-devel@alsa-project.org, linux-scsi@vger.kernel.org,
 netdev@vger.kernel.org, linux-wireless@vger.kernel.org,
 linux-kernel@vger.kernel.org, christophe.leroy@csgroup.eu,
 linux-ide@vger.kernel.org, npiggin@gmail.com, linux-serial@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On 2/1/23 23:36, Dawei Li wrote:
> Commit fc7a6209d571 ("bus: Make remove callback return void") forces
> bus_type::remove be void-returned, it doesn't make much sense for any
> bus based driver implementing remove callbalk to return non-void to
> its caller.
> 
> This change is for macio bus based drivers.
> 
> Signed-off-by: Dawei Li <set_pte_at@outlook.com>
> ---
> v2 -> v3
> - Rebased on latest powerpc/next.
> - cc' to relevant subsysem lists.
> 
> v1 -> v2
> - Revert unneeded changes.
> - Rebased on latest powerpc/next.
> 
> v1
> - https://lore.kernel.org/all/TYCP286MB2323FCDC7ECD87F8D97CB74BCA189@TYCP286MB2323.JPNP286.PROD.OUTLOOK.COM/
> ---
>  arch/powerpc/include/asm/macio.h                | 2 +-
>  drivers/ata/pata_macio.c                        | 4 +---
>  drivers/macintosh/rack-meter.c                  | 4 +---
>  drivers/net/ethernet/apple/bmac.c               | 4 +---
>  drivers/net/ethernet/apple/mace.c               | 4 +---
>  drivers/net/wireless/intersil/orinoco/airport.c | 4 +---
>  drivers/scsi/mac53c94.c                         | 5 +----
>  drivers/scsi/mesh.c                             | 5 +----
>  drivers/tty/serial/pmac_zilog.c                 | 7 ++-----
>  sound/aoa/soundbus/i2sbus/core.c                | 4 +---
>  10 files changed, 11 insertions(+), 32 deletions(-)

For the ata bits:

Acked-by: Damien Le Moal <damien.lemoal@opensource.wdc.com>

-- 
Damien Le Moal
Western Digital Research

