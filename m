Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B1BED2E3494
	for <lists+alsa-devel@lfdr.de>; Mon, 28 Dec 2020 07:55:52 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2407516EA;
	Mon, 28 Dec 2020 07:46:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2407516EA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1609138029;
	bh=4RnmYt3XqY2jUc5jsEy8Vkzbm+pgY1VhzY/BC662sVs=;
	h=Subject:From:To:References:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=j0sqamVI5pXIQuz4kUMlpXuh6tmozF3eft9SJaKEpq317ZKfvLNqR1q2gHMbJd4vU
	 sMQQ7bE+Xi6+psUeh8IodNdq1E5FNL89rGXot5YMunVTFAUCxROTqqgUWLlbdELHfd
	 5bKaS0aeg7IHpeTaA0pRBxyiV35gxtaVZ3Z4fY3U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 82ED0F801F5;
	Mon, 28 Dec 2020 07:45:29 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 24167F801F5; Mon, 28 Dec 2020 07:45:27 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from hqnvemgate24.nvidia.com (hqnvemgate24.nvidia.com
 [216.228.121.143])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 951A6F80143
 for <alsa-devel@alsa-project.org>; Mon, 28 Dec 2020 07:45:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 951A6F80143
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com
 header.b="EenvLDDf"
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate24.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
 id <B5fe97eff0000>; Sun, 27 Dec 2020 22:45:19 -0800
Received: from [10.25.99.38] (172.20.145.6) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 28 Dec
 2020 06:45:16 +0000
Subject: Re: [PATCH] ASoC: audio-graph-card: Drop remote-endpoint as required
 property
From: Sameer Pujar <spujar@nvidia.com>
To: Rob Herring <robh@kernel.org>
References: <1607498532-19518-1-git-send-email-spujar@nvidia.com>
 <20201210021550.GA1498001@robh.at.kernel.org>
 <1fd0f074-c437-2b83-e395-d4b83ae49444@nvidia.com>
Message-ID: <7509fece-63e7-0ef5-f600-805568611b77@nvidia.com>
Date: Mon, 28 Dec 2020 12:15:12 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <1fd0f074-c437-2b83-e395-d4b83ae49444@nvidia.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-Originating-IP: [172.20.145.6]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 HQMAIL107.nvidia.com (172.20.187.13)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1609137919; bh=4RnmYt3XqY2jUc5jsEy8Vkzbm+pgY1VhzY/BC662sVs=;
 h=Subject:From:To:CC:References:Message-ID:Date:User-Agent:
 MIME-Version:In-Reply-To:Content-Type:Content-Transfer-Encoding:
 Content-Language:X-Originating-IP:X-ClientProxiedBy;
 b=EenvLDDfhd51IiylLBGfmwfDCXXL/DZBRWFTW17FAWzeuUWb8i8ut7aTiMN8GPoC8
 2V5RTCO/QSsZFmhx2qV22jRevWChKy7ceAvRyAvCPXw9Eid60xRTFTTmfBJGpiUlUA
 N9bVW+Jni1bGKI9eY3YkhVeI3LPT66p6cSVvAhu1AIyVjdv7EkUeoJjjy3rzNdDIph
 hE3I/FXOKqiVR3hwD6MIiJTo8yim3q0L/GkXmma33QZ5ExRlRbfscFL0uIOXuS6ccv
 TGj6t3l1vvyyitG/uq9ilBk3hm7qUD0MfoIDvVRHbQ18iZNwhEIJTchUN0t4ei2LA0
 vZ2f8J+WZ1y8Q==
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org, broonie@kernel.org,
 linux-kernel@vger.kernel.org, kuninori.morimoto.gx@renesas.com
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

Hi Rob,

>>> The remote-endpoint may not be available if it is part of some
>>> pluggable module. One such example would be an audio card, the
>>> Codec endpoint will not be available until it is plugged in.
>>> Hence drop 'remote-endpoint' as a required property.
>> Please hold off on this. I have more changes coming.

Is this a good time to push for audio-graph-port changes?

