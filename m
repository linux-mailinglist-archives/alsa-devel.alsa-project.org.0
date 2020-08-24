Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 370A7251704
	for <lists+alsa-devel@lfdr.de>; Tue, 25 Aug 2020 13:04:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DCBD7167D;
	Tue, 25 Aug 2020 13:04:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DCBD7167D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1598353494;
	bh=oyXzsgWOgUSKqh7OmCxpMIN54jigix4a16FwR8oV1Jc=;
	h=Subject:From:To:References:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jbmgp69gSdb+BfvqY/pCqGRBIkpk8TlN8KJwaP6lMax7NQ1GIKygnSdQD6ZN3XUJP
	 sW94+en+CeiNIMQTUZeXOQenm60DlgvNibqgPm5k725couiHUCkvkImhLxHxBFo53J
	 Ye0s16fUOs/AnvWtS2HsgpGITGbKt6c5sknrf/kk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F3B1FF802DB;
	Tue, 25 Aug 2020 13:01:36 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C0897F801D9; Mon, 24 Aug 2020 14:31:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,NICE_REPLY_A,
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A761FF800B8
 for <alsa-devel@alsa-project.org>; Mon, 24 Aug 2020 14:31:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A761FF800B8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="PJT2i7oN"
Received: by mail-wm1-x343.google.com with SMTP id t14so7965252wmi.3
 for <alsa-devel@alsa-project.org>; Mon, 24 Aug 2020 05:31:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=oyXzsgWOgUSKqh7OmCxpMIN54jigix4a16FwR8oV1Jc=;
 b=PJT2i7oNvHTb8GIY3pbdq0CKqaYt9NAekVdTmH3v3/3onYeUE/NnOkyeVQk7zQxOTw
 OCirfXd3t3tTgOXCy3wmga+o2LzoqRGR+mlUiLXAbmWvKVAJCRYBMW1fcUGR3IZBG+H0
 Eo3XgVXOujSZ7x0hRe6VNl5CBNOzlLQRDT9YqMcOcQ5g7rwiy28NyTkrUfa+dqpfGNJL
 xpcZjRQ5iPGm5fI1eR8WGCtxBdPBSEJyepuDiM5n6wK1jUDsIkNnPSPKPPJ/CCotBeNr
 tooMxB1l1uSoZzBcPexlK5hlHt48rIGToAfGYQqHfWN/IqU20mb1N+L3vXfFoKG6G27+
 qsLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=oyXzsgWOgUSKqh7OmCxpMIN54jigix4a16FwR8oV1Jc=;
 b=DCLz30oYs0X19tBgZiuvucCMmM88GsuOfv8lavVv9d2JwBjBnhOBUTuP0JmwZXVjXN
 u73aA+LJkUVItnhKvJeD8qovRKOd8UFX1Zzs5+GDz2qt3yE80I9Y/ttGA3JEzlm2dH7N
 zJCrUYZ8zW18D/ySPr4Bde6QwrbYZDDP1xcQoZYArbvlyKz/u1TYiAmYh3ABLO8ZdpyN
 Z7f3wWfJbpaAJb9GlcSZgwYWnVhtbaylwj2j0ugkjHXbqtIZoqSO084FlgDx7DMdV1WF
 Koi2nYOK2YaTlOlgY9il4sDU3lH6A2YBhc3eV7n1uV2e5fOXWEF+HOoZcnkm+FckI2aq
 u/3Q==
X-Gm-Message-State: AOAM530iAXBOUwouqZYszU0puglPm/sY4nEj9MY34c+7s+xhigxQQhnH
 a2QtCrFvgSXCH/s4InTp61w=
X-Google-Smtp-Source: ABdhPJzCG8ZeDcWVct1PS4h/Vf1ItylB7hBVwzVNHzXGcW19wknoM4zUvaEth3ZoSDxUERetRqAPGA==
X-Received: by 2002:a7b:cf07:: with SMTP id l7mr1519763wmg.93.1598272279039;
 Mon, 24 Aug 2020 05:31:19 -0700 (PDT)
Received: from [192.168.0.16]
 (cpc83661-brig20-2-0-cust443.3-3.cable.virginm.net. [82.28.105.188])
 by smtp.gmail.com with ESMTPSA id x8sm20292007wrq.42.2020.08.24.05.31.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Aug 2020 05:31:18 -0700 (PDT)
Subject: Re: [PATCH] ALSA: hda/realtek: Add quirk for Samsung Galaxy Book Ion
 15 inches
From: Alex Dewar <alex.dewar90@gmail.com>
To: adrien.crivelli@gmail.com
References: <7210c752-0a1f-3985-91f0-b70facf0293c@gmail.com>
Message-ID: <30693624-744d-6971-1dc8-8ffe4df6082c@gmail.com>
Date: Mon, 24 Aug 2020 13:31:17 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <7210c752-0a1f-3985-91f0-b70facf0293c@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-Mailman-Approved-At: Tue, 25 Aug 2020 13:01:32 +0200
Cc: alsa-devel@alsa-project.org, tiwai@suse.com, linux-kernel@vger.kernel.org
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

My mistake -- I didn't read your changelog properly. Sorry!

On 24/08/2020 13:30, Alex Dewar wrote:
> There's a mistake in this. The ID numbers are the wrong way round.
>
> Alex

