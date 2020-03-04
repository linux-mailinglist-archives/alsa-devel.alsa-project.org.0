Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E9EC179356
	for <lists+alsa-devel@lfdr.de>; Wed,  4 Mar 2020 16:27:52 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 16EB91662;
	Wed,  4 Mar 2020 16:27:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 16EB91662
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1583335672;
	bh=9rXQvKAQVTQNiz8aLIx1L4CJNnzKfuj0cKZPeiF7ASI=;
	h=To:From:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=eADhKCdcXxcamYBQHZ6hTCepoXdUeQXPF54dB6ls11AavVqknyhD5AOZ+PfSWrchW
	 eBmr8SqvtEmnnfz4qs68eOLgClKr6cazg70JfzFRwc94n6punvDEHETqM+HXvBcKPk
	 7kNhiAA0biEzQcwb4s7MXj8nUduxj3uC+M6kdl34=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1FE3AF8011C;
	Wed,  4 Mar 2020 16:26:11 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BB61AF801ED; Wed,  4 Mar 2020 16:26:08 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, RCVD_IN_DNSWL_BLOCKED, SPF_HELO_PASS,
 SPF_PASS autolearn=disabled version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CB6F9F8012D
 for <alsa-devel@alsa-project.org>; Wed,  4 Mar 2020 16:26:04 +0100 (CET)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 4A606A003F;
 Wed,  4 Mar 2020 16:26:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 4A606A003F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1583335561; bh=fxtx+XqNIX08h6ygcDl8/zsAP2qz/FDotYgnmDnXe8Q=;
 h=To:Cc:From:Subject:Date:From;
 b=QqKvq68ypRbWiXJ0nKIEjxfek+EKnuAiKDSfJG9UehcMt6vqCrSVRCyPy7cohOdRu
 DMzOie2rV6amQfdJoLSY8VypML4tk3EQ9MgwUMnnvDnOhHexNB4kaeX5wUUsOqa/GP
 tVpvW5hzGDNojrpw7X1Pmya7o4JPJrF/7N4o8BmE=
Received: from p50.perex-int.cz (unknown [192.168.100.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Wed,  4 Mar 2020 16:25:55 +0100 (CET)
To: stable@vger.kernel.org
From: Jaroslav Kysela <perex@perex.cz>
Subject: 5.5.y - apply "ASoC: intel/skl/hda - export number of digital
 microphones via control components"
Message-ID: <147efa37-eb57-7f17-b9eb-84a9fe5ad475@perex.cz>
Date: Wed, 4 Mar 2020 16:25:54 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: Sasha Levin <sashal@kernel.org>, Takashi Iwai <tiwai@suse.de>,
 ALSA development <alsa-devel@alsa-project.org>,
 Mark Brown <broonie@kernel.org>,
 Pierre-louis Bossart <pierre-louis.bossart@linux.intel.com>
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

Hi,

   could we cherry-pick patch 8cd9956f61c65022209ce6d1e55ed12aea12357d to the 
5.5 stable tree?

8cd9956f61c65022209ce6d1e55ed12aea12357d :
  "ASoC: intel/skl/hda - export number of digital microphones via control 
components"

   Rerefences:

https://gitlab.freedesktop.org/pulseaudio/pulseaudio/issues/817

				Thank you,
					Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
