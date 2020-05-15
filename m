Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 791DB1D49E9
	for <lists+alsa-devel@lfdr.de>; Fri, 15 May 2020 11:47:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 08346166A;
	Fri, 15 May 2020 11:46:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 08346166A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1589536062;
	bh=XO54KtDxmPDX9TVtQvvNno6Cl5uaV+SZkZPl/UgS+6I=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=eG/jwuH/Pi9TKB5blDrIQFOAXdlQ7Ix1RtVspzlAwsf2rtNKGRxytHPy+bF0GT6Gr
	 6TUoEX8kcLmd7fWX1az6WBIkiX5avW8zpujXNyw3VfP82VJVOuPdzx/6gGvV0QgFT2
	 /lbcsLyKFetM4brT2QGWW91w3kreRRUpBd32Z0DY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2E5F3F80253;
	Fri, 15 May 2020 11:46:01 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id ED0BEF80247; Fri, 15 May 2020 11:45:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from bollie.ca9.eu (bollie.ca9.eu
 [IPv6:2a01:238:439b:aa00:6132:efc3:700a:5a2])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 830FBF800E3
 for <alsa-devel@alsa-project.org>; Fri, 15 May 2020 11:45:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 830FBF800E3
Received: by bollie.ca9.eu (Postfix, from userid 8)
 id 03AD1C607C; Fri, 15 May 2020 11:45:45 +0200 (CEST)
Received: from [192.168.1.100] (p3E9D4712.dip0.t-ipconnect.de [62.157.71.18])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by bollie.ca9.eu (Postfix) with ESMTPSA id BE48DBFB08;
 Fri, 15 May 2020 11:45:44 +0200 (CEST)
Subject: Re: [PATCH v2] RME Babyface Pro mixer patch: Fixing max vol
To: Takashi Iwai <tiwai@suse.de>
References: <20200514171555.67rqof74ubns3dmx@bollie.ca9.eu>
 <s5hftc1objb.wl-tiwai@suse.de>
From: Thomas Ebeling <penguins@bollie.de>
Message-ID: <741e37a9-013f-4f90-2c16-6f388b624f35@bollie.de>
Date: Fri, 15 May 2020 11:45:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <s5hftc1objb.wl-tiwai@suse.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Cc: alsa-devel@alsa-project.org, tiwai@suse.com
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


On 15.05.20 10:19, Takashi Iwai wrote:
> The v1 patch has been already merged to for-next branch.  Could you
> submit an incremental patch to just correct the max value?

Sure. Shall I keep alsa-devel as recipient?

Kind regards

Thomas


