Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AAF5037D421
	for <lists+alsa-devel@lfdr.de>; Wed, 12 May 2021 22:14:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4825917F5;
	Wed, 12 May 2021 22:13:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4825917F5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1620850451;
	bh=v/GUEgDAH2zHjgzBDpHhld6sXHraAFJfbTzhaVBWw7g=;
	h=To:From:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=LiLFmD80z6SnnDCqctke0B/+jL6F3Ac1WXhXikSlC/As7uKF+K+FVM77LIAl3zTXR
	 JqXjzwmTmQAJF+GAMIhYjlIrwo9XlnisBlXY5wzAEnwAQX3K3espWjsLb/7Qpq1Shf
	 eqHQ0N89xymKGL3Sa93LdjR9pVwaA2aOAQPEzAl8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9818DF800E9;
	Wed, 12 May 2021 22:12:44 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DE31AF80240; Wed, 12 May 2021 22:12:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 828D9F8012E
 for <alsa-devel@alsa-project.org>; Wed, 12 May 2021 22:12:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 828D9F8012E
Received: from 1.general.cking.uk.vpn ([10.172.193.212])
 by youngberry.canonical.com with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.93)
 (envelope-from <colin.king@canonical.com>)
 id 1lgvDi-00051o-1p; Wed, 12 May 2021 20:12:38 +0000
To: Yang Li <yang.lee@linux.alibaba.com>
From: Colin Ian King <colin.king@canonical.com>
Subject: re: ASoC: q6dsp: q6afe: remove unneeded dead-store initialization
Message-ID: <5935b287-5b74-84ac-3470-3b71fd69c88c@canonical.com>
Date: Wed, 12 May 2021 21:12:37 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "Banajit Goswami <bgoswami"@codeaurora.org, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
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

Static analysis with Coverity on linux-next has detected an issue with
the following commit:

commit 5f1b95d08de712327e452d082a50fded435ec884
Author: Yang Li <yang.lee@linux.alibaba.com>
Date:   Sun Apr 25 18:12:33 2021 +0800

    ASoC: q6dsp: q6afe: remove unneeded dead-store initialization

the analysis is as follows:

1181 int q6afe_port_stop(struct q6afe_port *port)
1182 {
1183        struct afe_port_cmd_device_stop *stop;
1184        struct q6afe *afe = port->afe;
1185        struct apr_pkt *pkt;

    1. var_decl: Declaring variable port_id without initializer.

1186        int port_id;
1187        int ret = 0;
1188        int index, pkt_size;
1189        void *p;
1190
1191        index = port->token;

    2. Condition index < 0, taking false branch.
    3. Condition index >= 127, taking false branch.

1192        if (index < 0 || index >= AFE_PORT_MAX) {
1193                dev_err(afe->dev, "AFE port index[%d] invalid!\n",
index);
1194                return -EINVAL;
1195        }
1196
1197        pkt_size = APR_HDR_SIZE + sizeof(*stop);
1198        p = kzalloc(pkt_size, GFP_KERNEL);

    4. Condition !p, taking false branch.

1199        if (!p)
1200                return -ENOMEM;
1201
1202        pkt = p;
1203        stop = p + APR_HDR_SIZE;
1204
1205        pkt->hdr.hdr_field = APR_HDR_FIELD(APR_MSG_TYPE_SEQ_CMD,
1206                                           APR_HDR_LEN(APR_HDR_SIZE),
1207                                           APR_PKT_VER);
1208        pkt->hdr.pkt_size = pkt_size;
1209        pkt->hdr.src_port = 0;
1210        pkt->hdr.dest_port = 0;
1211        pkt->hdr.token = index;
1212        pkt->hdr.opcode = AFE_PORT_CMD_DEVICE_STOP;

    Uninitialized scalar variable (UNINIT)
    5. uninit_use: Using uninitialized value port_id.

1213        stop->port_id = port_id;
1214        stop->reserved = 0;

the commit removed the initialization of port_id = port->id, and now we
have a regression where stop->port_id is being assigned with a garbage
uninitialized value in port_id.  Perhaps the fix needs reverting. As it
stands, I don't know why clang was reporting this as an error.

Colin
