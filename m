Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 36B3E465D85
	for <lists+alsa-devel@lfdr.de>; Thu,  2 Dec 2021 05:43:51 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9E1542564;
	Thu,  2 Dec 2021 05:43:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9E1542564
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1638420230;
	bh=Q/XmdYzmWlBC/voF+84Cd3udQjdonRFCNCIqCUmDhDk=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=sU4udmjcW2tlryffQ8N9NeNEIowJefcXgnBDWWpKB7bHcpPBWWfLHIqzsN+c4dcvb
	 lhZhZHAVgohCBqBw168F9VIi0Za+vSOO2ixARfVxWqdzRgNMJB3UfvwfPSYf2ZNRRl
	 XQ0Tyvs2yqTywrqA9VAcXcRaXHy8N42euOB68nyY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A7E0CF8032D;
	Thu,  2 Dec 2021 05:42:58 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DE6EEF804E2; Thu,  2 Dec 2021 05:42:54 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PDS_TONAME_EQ_TOLOCAL_SHORT,SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED,USER_IN_DEF_DKIM_WL autolearn=disabled version=3.4.0
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com
 [IPv6:2607:f8b0:4864:20::62a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 66DDCF800BE
 for <alsa-devel@alsa-project.org>; Thu,  2 Dec 2021 05:42:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 66DDCF800BE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="NNI4lbBL"
Received: by mail-pl1-x62a.google.com with SMTP id y7so19386603plp.0
 for <alsa-devel@alsa-project.org>; Wed, 01 Dec 2021 20:42:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=Q/XmdYzmWlBC/voF+84Cd3udQjdonRFCNCIqCUmDhDk=;
 b=NNI4lbBLOzUh6enNA2zXDD6i/1bbGmC+FP6nollo+ZHi511xLiHCuXuklfoEatdbSW
 c/K2UDB3imN6OpU5wZVX9y/cgHytjg748J8xZWdpWc5c2s/mjPDhWwgVMqKKaZGX/KR8
 N5KEWOuSX6ObkcWzGMI0QUSJfrREjzwt0FlH38L7xhCnOUlCDKqwF76FdcUJMuPKFyyf
 NcPOfpJLQ3fdoJX6usozrWel3ddfQu+4oIgNFru6sBQG3JAIVq+ToAIk0jcJUNombClm
 98B1D6VwKpA9QpeCwgFuO6oyX8A9MSk+vYb9i38GLAnPQQTpxaDTVACDW5OSlJ7IfZLR
 NVnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Q/XmdYzmWlBC/voF+84Cd3udQjdonRFCNCIqCUmDhDk=;
 b=KwLnKoZh6AlsDzxxapVNngdVl7YEXOalHzvkfDrCrpkzJOWbthqIjQB4OtZYwZf/L+
 KQD60ylFv7pmkLJ6lAhEoSmHV88EFEz5HNiOvm6P1jiaShuKWm/f9HZ7QFfuAOOyIKyV
 6k14TF8ZQ2EIKewr1vlt7E7zQbBHBnEKigcsxMb4PRk43OVkbm2lxikXC9AY+OM7h5SZ
 vOax5yv+zx4eiz6ypVBjxeG7xEPIFEzYsFIo9V+TAtVZgQZArWTATR+iD0T5+V0sJi1V
 EwIzKiIC4GvC9LYBzEsnQ3cfBzX+wlmnePQhWsIEBZEGHJ+CEPqvURrh5xLs0wcL+Czr
 GSsw==
X-Gm-Message-State: AOAM533hymA1G5TYVeFg6dinYKU/GXBO1NUvRytFKJIo7rcQwozmmpJX
 gKnPo1ep1z33fyZRLgCRiVlOIF+OZxbB4g==
X-Google-Smtp-Source: ABdhPJwd7LFTasLsCKCBBJSOBzXW1hcUhBvCVvh8QO8kQ/q9LWJdPJFWFfi3xByxw9fLIekXcskJdw==
X-Received: by 2002:a17:903:1208:b0:143:e4e9:4ce3 with SMTP id
 l8-20020a170903120800b00143e4e94ce3mr12739440plh.21.1638420159291; 
 Wed, 01 Dec 2021 20:42:39 -0800 (PST)
Received: from google.com ([2401:fa00:1:10:ce4d:ddd8:41f4:d987])
 by smtp.gmail.com with ESMTPSA id p19sm1545646pfo.92.2021.12.01.20.42.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Dec 2021 20:42:39 -0800 (PST)
Date: Thu, 2 Dec 2021 12:42:34 +0800
From: Tzung-Bi Shih <tzungbi@google.com>
To: "allen-kh.cheng" <allen-kh.cheng@mediatek.com>
Subject: Re: [PATCH v9 2/3] firmware: mediatek: add adsp ipc protocol interface
Message-ID: <YahOuiIZ/wGR/TpD@google.com>
References: <20211201075604.27864-1-allen-kh.cheng@mediatek.com>
 <20211201075604.27864-3-allen-kh.cheng@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211201075604.27864-3-allen-kh.cheng@mediatek.com>
Cc: devicetree@vger.kernel.org, Linux-ALSA <alsa-devel@alsa-project.org>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, cujomalainey@google.com,
 linux-kernel@vger.kernel.org, Jassi Brar <jassisinghbrar@gmail.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Rob Herring <robh+dt@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Mark Brown <broonie@kernel.org>, linux-mediatek@lists.infradead.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 Daniel Baluta <daniel.baluta@nxp.com>, linux-arm-kernel@lists.infradead.org,
 sound-open-firmware@alsa-project.org
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

On Wed, Dec 01, 2021 at 03:56:03PM +0800, allen-kh.cheng wrote:
> Signed-off-by: Allen-KH Cheng <Allen-KH.Cheng@mediatek.com>

Reviewed-by: Tzung-Bi Shih <tzungbi@google.com>
