Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B054F697BFF
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Feb 2023 13:39:15 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2B85C82E;
	Wed, 15 Feb 2023 13:38:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2B85C82E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1676464754;
	bh=maGtHjzFaF1HAyDrKAFsw2fGzDZFcLB2DcMRG1RYFPw=;
	h=Date:Subject:To:References:From:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ngFp1/Ii2l2d32SEciQ8Hsjvt1/wjnoPyrdrSWvMB6Stgs7AMim+aeyGJo84m7kAj
	 mSfHo6BsCSnsa9wTo5IAVW2TMsxdCLGjziavDYyHy+Z8w+Tt46YDkMSSkybJuk73h3
	 n9letq1DCqQtlWeS5IwZ4tDZKbRjlisvx7zZhG5o=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 60EF2F801C0;
	Wed, 15 Feb 2023 13:38:23 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AA49DF8047C; Wed, 15 Feb 2023 13:38:19 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [46.235.227.172])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 48AB4F800E4
	for <alsa-devel@alsa-project.org>; Wed, 15 Feb 2023 13:38:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 48AB4F800E4
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=collabora.com header.i=@collabora.com
 header.a=rsa-sha256 header.s=mail header.b=fgAsH4Dm
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id C193666020BD;
	Wed, 15 Feb 2023 12:38:10 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1676464691;
	bh=maGtHjzFaF1HAyDrKAFsw2fGzDZFcLB2DcMRG1RYFPw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=fgAsH4Dmr4t5TkVVZhkYYaTmyWw0+dCCh2JEsZQzy+pU9LTIM9jqQp5O8LhaxS9uG
	 k1fKruqe9BrPK4ZiPpSjPUuGNhMSy5vw1NF8Kb/ChG8ESRuMKeclQlBEc8KglYPUnO
	 JloDcCTT9SHC0QyzNS0VpemIanGuyf8YPxdkEt7VnhsC6IV6dF4z11bXCCEDlDUaXM
	 poBOHanlSR7QTZ4RPUKP1QiCAqfCx04vNNUgYsdubQ6TGkg2CtsISftg2Q7f3jqqGu
	 QE7fPILS00rO8fmsONJZ6mHlQRmnUdJj107nFqZikcqKd7i2iy6H0XVjQj6k/3yW8u
	 XPfwverVPELMQ==
Message-ID: <dd3a6b7f-7d42-40f9-dc35-1f6266c8b87c@collabora.com>
Date: Wed, 15 Feb 2023 13:38:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [PATCH] ASoC: soc-dapm.h: fixup warning struct snd_pcm_substream
 not declared
Content-Language: en-US
To: Lucas Tanure <lucas.tanure@collabora.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Charles Keepax <ckeepax@opensource.cirrus.com>
References: <20230215094643.823156-1-lucas.tanure@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230215094643.823156-1-lucas.tanure@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: 6WFLNRGKJDPA7FQAXFHM6K42KVY5MPG5
X-Message-ID-Hash: 6WFLNRGKJDPA7FQAXFHM6K42KVY5MPG5
X-MailFrom: angelogioacchino.delregno@collabora.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 kernel@collabora.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6WFLNRGKJDPA7FQAXFHM6K42KVY5MPG5/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Il 15/02/23 10:46, Lucas Tanure ha scritto:
> Add sound/pcm.h header to include struct snd_pcm_substream used in
> snd_soc_dapm_update_dai function.
> 
> Fixes: 078a85f2806f ("ASoC: dapm: Only power up active channels from a DAI")
> Signed-off-by: Lucas Tanure <lucas.tanure@collabora.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


