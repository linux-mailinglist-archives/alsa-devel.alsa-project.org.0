Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 510A23043F1
	for <lists+alsa-devel@lfdr.de>; Tue, 26 Jan 2021 17:43:41 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C22AA17A9;
	Tue, 26 Jan 2021 17:42:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C22AA17A9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1611679420;
	bh=8KhWd45yIGjdlEkMYWC+1Ik/huDzUsQ5U3rR4pfDous=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fM2G4XsOQcgw9iiIu49XoWiGjkqLEfOD0wqFN0i2owFZmpBiwPvp2ZnBBTGLmV+tb
	 FuHdwcvPlS6aPwLw+nVz9mmJfWNWubkxy1quwtqWz4my4wgo7M38dnklBeCfqF/gRn
	 7hCsjh9po93qUHgKLNXn1+dhi1emVuX7/dLJ9KS4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 69F43F8020D;
	Tue, 26 Jan 2021 17:42:48 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 78A6AF801ED; Tue, 26 Jan 2021 17:42:46 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7EB0AF801D8
 for <alsa-devel@alsa-project.org>; Tue, 26 Jan 2021 17:42:39 +0100 (CET)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 7E113A0040;
 Tue, 26 Jan 2021 17:42:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 7E113A0040
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1611679359; bh=qY9n9yekw4BlSPmbNOOQvnbtlqR8lAo8K2sg5E+moE8=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=FOiHVKCpY13zW/PhI8fQ+zJG9yE95ijCjopOlIALpQrSsUTKdHqd4MazO0Pdv+Kwq
 4N/4aBU84taptCnUiKJ3onS0HGVa56Vf+s+ZCxDxvTvjCml9TMibj8PjczZ+CvHOSE
 GXbA+g2dPVZFfliB/Gr7fbP/mBuQTOgI5ReA+tHQ=
Received: from p1gen2.localdomain (unknown [192.168.100.98])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Tue, 26 Jan 2021 17:42:29 +0100 (CET)
Subject: Re: [PATCH 1/3] ASoC: SOF: allow soundwire use
 desc->default_fw_filename
To: Kai Vehmanen <kai.vehmanen@linux.intel.com>, alsa-devel@alsa-project.org, 
 broonie@kernel.org
References: <20210125070500.807474-1-kai.vehmanen@linux.intel.com>
From: Jaroslav Kysela <perex@perex.cz>
Message-ID: <08e25344-f5a7-9799-bf9e-9beb2a281dba@perex.cz>
Date: Tue, 26 Jan 2021 17:42:29 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210125070500.807474-1-kai.vehmanen@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: Libin Yang <libin.yang@intel.com>,
 Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 ranjani.sridharan@linux.intel.com, lgirdwood@gmail.com,
 pierre-louis.bossart@linux.intel.com, daniel.baluta@nxp.com,
 Bard Liao <bard.liao@intel.com>
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

Dne 25. 01. 21 v 8:04 Kai Vehmanen napsal(a):
> From: Libin Yang <libin.yang@intel.com>
> 
> The old code always uses sof_fw_filename in struct snd_soc_acpi_mach
> as the firmware name. However, firmware name should depend on the platform
> instead of the machine. For example, different machines may use the same
> soundwire link topology, but they are using the different firmware. In this
> case, it's hard to determine in struct snd_soc_acpi_mach which firmware it
> should use.
> 
> Signed-off-by: Libin Yang <libin.yang@intel.com>
> Reviewed-by: Bard Liao <bard.liao@intel.com>
> Reviewed-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
> Signed-off-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>

Tested-by: Jaroslav Kysela <perex@perex.cz>

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
