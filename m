Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F8177125DA
	for <lists+alsa-devel@lfdr.de>; Fri, 26 May 2023 13:46:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 94988847;
	Fri, 26 May 2023 13:45:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 94988847
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1685101596;
	bh=zR5R4Vq2IPo/VBXevYp0LVZprsPbhZ/CqyLh4yhc+1s=;
	h=Date:From:To:Cc:Subject:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=mmA6swdBdgmik8/DhepQx5XfZQDn7wK7KBHyqhSxP58nAujrf4/TPH2cyH9FaBFg5
	 aNaWvjhQn3q1Y1K6F7bjDCjzzH3hP+IPyQUMztl/gZ4guij3Y6yOMdO6Q/jeCy5ClQ
	 PCx4N6jmDFnMxFP7aFtkMqJCFQPPlmEAw1d1JAUQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 233E9F805E3; Fri, 26 May 2023 13:43:55 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 87D7BF805E3;
	Fri, 26 May 2023 13:43:55 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0BEB1F80249; Fri, 26 May 2023 09:05:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id AC5A5F80086
	for <alsa-devel@alsa-project.org>; Fri, 26 May 2023 09:05:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AC5A5F80086
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=YSrKeg5w
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-3090d3e9c92so308486f8f.2
        for <alsa-devel@alsa-project.org>;
 Fri, 26 May 2023 00:05:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685084701; x=1687676701;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AEB3j9Hm4cFEq/IWrgb9Zt9idZi6mpH7UvBj/2wltyE=;
        b=YSrKeg5whAJDn0g5cVRpfV7wR1PzZGXcMZUAkUVutOyRE/1794U3lHibYoa0McpWoc
         TyCSwKXjmrBMXeKGb02wLVSvpUFQMW/UnYQ6CABaoywBxUOVXLabFwzkcU+NOsp/SIWd
         l+eWzr9ypgocfjfcdFESwzQIJRUlpzPoVnZ5Gd49eqdmQrAKMlphMRoJX9on8MIZZirA
         rHZFKlcExktHHZ0g0W0TWDUN8BSEag9b3cVUwpo6Vnuc7PhvCeazcYNfGuwY535KFj56
         E5vVVCkKT4IkK6fTlwPNEkZ/EKHSwMVXN8mD9bW93VTKIofeHKcJT4/Fl0bqk0GXSd2f
         xM8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685084701; x=1687676701;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AEB3j9Hm4cFEq/IWrgb9Zt9idZi6mpH7UvBj/2wltyE=;
        b=e6ZeWeFukLSKDqq/xltqeKLaTRU8thGMifJIsKIRgXfD//CqOym6h9bGj9hul3oBRA
         IeNIpDke6tDw78JMpaTe9AMQXqiPeliMC/CQimwlfQB2XEyH6lp7e0i8WFhl9PgyJv77
         +deXWNvmPY+58tK3BF8kF6gB7MIzG4LzkcBtphIzAedC47Eda8GwiRd7f2svRedVN8f/
         NG3I0kkzpNt2FHfhNGZjzrNB7x9FCnaabxEIXCs+V9ZZ4+B/tSLZUGPK0bmXsTARtkZ4
         2co4gTdjtWxYELRkvuXKkeonJRAt3oJjolIXSr7pNx3g4O50G6/OWMdeb7ur5W65BeRT
         Vplg==
X-Gm-Message-State: AC+VfDzQTUyHPFjB23pN9G0XBj9DwR9KMX+e9tr9CrBqyqSuxfNQz3mV
	ng46EuQbJXLrqUiqVHY4lQZKxg==
X-Google-Smtp-Source: 
 ACHHUZ436Ll/zuj+aPZ58CU5j/t4v3v5iYkysrtJQ7kI4HwVs1SAf0wTOXQ6UMRhdRD5DYbfC7pd8g==
X-Received: by 2002:adf:cd8e:0:b0:306:3ec8:289d with SMTP id
 q14-20020adfcd8e000000b003063ec8289dmr689173wrj.46.1685084701478;
        Fri, 26 May 2023 00:05:01 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id
 f17-20020a5d5691000000b0030497b3224bsm4017317wrv.64.2023.05.26.00.04.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 May 2023 00:05:00 -0700 (PDT)
Date: Fri, 26 May 2023 10:04:56 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Takashi Iwai <tiwai@suse.de>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	alsa-devel@alsa-project.org, Jaroslav Kysela <perex@perex.cz>
Subject: [tiwai-sound:topic/midi20 25/40] sound/core/seq/seq_clientmgr.c:482
 snd_seq_read() error: copy_to_user() '&cell->event' too small (28 vs 32)
Message-ID: <53743044-5b66-43ab-9675-db0eeed69736@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-MailFrom: dan.carpenter@linaro.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: 7ZNQ5AHEW3GO3FBDZ3DST2JACALR2OZ4
X-Message-ID-Hash: 7ZNQ5AHEW3GO3FBDZ3DST2JACALR2OZ4
X-Mailman-Approved-At: Fri, 26 May 2023 11:43:42 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7ZNQ5AHEW3GO3FBDZ3DST2JACALR2OZ4/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git topic/midi20
head:   77700b81bd0e47d89d50eb4b3f2f323492f79998
commit: 46397622a3fa8372b8fda0f04b33d16923b03b1b [25/40] ALSA: seq: Add UMP support
config: i386-randconfig-m021-20230525 (https://download.01.org/0day-ci/archive/20230526/202305261415.NY0vapZK-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202305261415.NY0vapZK-lkp@intel.com/

smatch warnings:
sound/core/seq/seq_clientmgr.c:482 snd_seq_read() error: copy_to_user() '&cell->event' too small (28 vs 32)

vim +482 sound/core/seq/seq_clientmgr.c

c7e0b5bf9fff1b Takashi Iwai    2005-11-17  407  static ssize_t snd_seq_read(struct file *file, char __user *buf, size_t count,
c7e0b5bf9fff1b Takashi Iwai    2005-11-17  408  			    loff_t *offset)
^1da177e4c3f41 Linus Torvalds  2005-04-16  409  {
c7e0b5bf9fff1b Takashi Iwai    2005-11-17  410  	struct snd_seq_client *client = file->private_data;
c7e0b5bf9fff1b Takashi Iwai    2005-11-17  411  	struct snd_seq_fifo *fifo;
46397622a3fa83 Takashi Iwai    2023-05-23  412  	size_t aligned_size;
^1da177e4c3f41 Linus Torvalds  2005-04-16  413  	int err;
^1da177e4c3f41 Linus Torvalds  2005-04-16  414  	long result = 0;
c7e0b5bf9fff1b Takashi Iwai    2005-11-17  415  	struct snd_seq_event_cell *cell;
^1da177e4c3f41 Linus Torvalds  2005-04-16  416  
^1da177e4c3f41 Linus Torvalds  2005-04-16  417  	if (!(snd_seq_file_flags(file) & SNDRV_SEQ_LFLG_INPUT))
^1da177e4c3f41 Linus Torvalds  2005-04-16  418  		return -ENXIO;
^1da177e4c3f41 Linus Torvalds  2005-04-16  419  
96d4f267e40f95 Linus Torvalds  2019-01-03  420  	if (!access_ok(buf, count))
^1da177e4c3f41 Linus Torvalds  2005-04-16  421  		return -EFAULT;
^1da177e4c3f41 Linus Torvalds  2005-04-16  422  
^1da177e4c3f41 Linus Torvalds  2005-04-16  423  	/* check client structures are in place */
7eaa943c8ed8e9 Takashi Iwai    2008-08-08  424  	if (snd_BUG_ON(!client))
7eaa943c8ed8e9 Takashi Iwai    2008-08-08  425  		return -ENXIO;
^1da177e4c3f41 Linus Torvalds  2005-04-16  426  
f9a6bb841f7370 Takashi Iwai    2021-06-08  427  	if (!client->accept_input)
f9a6bb841f7370 Takashi Iwai    2021-06-08  428  		return -ENXIO;
f9a6bb841f7370 Takashi Iwai    2021-06-08  429  	fifo = client->data.user.fifo;
f9a6bb841f7370 Takashi Iwai    2021-06-08  430  	if (!fifo)
^1da177e4c3f41 Linus Torvalds  2005-04-16  431  		return -ENXIO;
^1da177e4c3f41 Linus Torvalds  2005-04-16  432  
^1da177e4c3f41 Linus Torvalds  2005-04-16  433  	if (atomic_read(&fifo->overflow) > 0) {
^1da177e4c3f41 Linus Torvalds  2005-04-16  434  		/* buffer overflow is detected */
^1da177e4c3f41 Linus Torvalds  2005-04-16  435  		snd_seq_fifo_clear(fifo);
^1da177e4c3f41 Linus Torvalds  2005-04-16  436  		/* return error code */
^1da177e4c3f41 Linus Torvalds  2005-04-16  437  		return -ENOSPC;
^1da177e4c3f41 Linus Torvalds  2005-04-16  438  	}
^1da177e4c3f41 Linus Torvalds  2005-04-16  439  
^1da177e4c3f41 Linus Torvalds  2005-04-16  440  	cell = NULL;
^1da177e4c3f41 Linus Torvalds  2005-04-16  441  	err = 0;
^1da177e4c3f41 Linus Torvalds  2005-04-16  442  	snd_seq_fifo_lock(fifo);
^1da177e4c3f41 Linus Torvalds  2005-04-16  443  
46397622a3fa83 Takashi Iwai    2023-05-23  444  	if (client->midi_version > 0)
46397622a3fa83 Takashi Iwai    2023-05-23  445  		aligned_size = sizeof(struct snd_seq_ump_event);
46397622a3fa83 Takashi Iwai    2023-05-23  446  	else
46397622a3fa83 Takashi Iwai    2023-05-23  447  		aligned_size = sizeof(struct snd_seq_event);
46397622a3fa83 Takashi Iwai    2023-05-23  448  
^1da177e4c3f41 Linus Torvalds  2005-04-16  449  	/* while data available in queue */
46397622a3fa83 Takashi Iwai    2023-05-23  450  	while (count >= aligned_size) {
^1da177e4c3f41 Linus Torvalds  2005-04-16  451  		int nonblock;
^1da177e4c3f41 Linus Torvalds  2005-04-16  452  
^1da177e4c3f41 Linus Torvalds  2005-04-16  453  		nonblock = (file->f_flags & O_NONBLOCK) || result > 0;
f9a6bb841f7370 Takashi Iwai    2021-06-08  454  		err = snd_seq_fifo_cell_out(fifo, &cell, nonblock);
f9a6bb841f7370 Takashi Iwai    2021-06-08  455  		if (err < 0)
^1da177e4c3f41 Linus Torvalds  2005-04-16  456  			break;
46397622a3fa83 Takashi Iwai    2023-05-23  457  		if (!event_is_compatible(client, &cell->event)) {
46397622a3fa83 Takashi Iwai    2023-05-23  458  			snd_seq_cell_free(cell);
46397622a3fa83 Takashi Iwai    2023-05-23  459  			cell = NULL;
46397622a3fa83 Takashi Iwai    2023-05-23  460  			continue;
46397622a3fa83 Takashi Iwai    2023-05-23  461  		}
^1da177e4c3f41 Linus Torvalds  2005-04-16  462  		if (snd_seq_ev_is_variable(&cell->event)) {

Smatch isn't clever enough to know that if snd_seq_ev_is_variable()
is false that means client->midi_version is zero.

46397622a3fa83 Takashi Iwai    2023-05-23  463  			struct snd_seq_ump_event tmpev;
46397622a3fa83 Takashi Iwai    2023-05-23  464  
46397622a3fa83 Takashi Iwai    2023-05-23  465  			memcpy(&tmpev, &cell->event, aligned_size);
^1da177e4c3f41 Linus Torvalds  2005-04-16  466  			tmpev.data.ext.len &= ~SNDRV_SEQ_EXT_MASK;
46397622a3fa83 Takashi Iwai    2023-05-23  467  			if (copy_to_user(buf, &tmpev, aligned_size)) {
^1da177e4c3f41 Linus Torvalds  2005-04-16  468  				err = -EFAULT;
^1da177e4c3f41 Linus Torvalds  2005-04-16  469  				break;
^1da177e4c3f41 Linus Torvalds  2005-04-16  470  			}
46397622a3fa83 Takashi Iwai    2023-05-23  471  			count -= aligned_size;
46397622a3fa83 Takashi Iwai    2023-05-23  472  			buf += aligned_size;
4d23359b7ec8b0 Clemens Ladisch 2005-09-05  473  			err = snd_seq_expand_var_event(&cell->event, count,
4d23359b7ec8b0 Clemens Ladisch 2005-09-05  474  						       (char __force *)buf, 0,
46397622a3fa83 Takashi Iwai    2023-05-23  475  						       aligned_size);
^1da177e4c3f41 Linus Torvalds  2005-04-16  476  			if (err < 0)
^1da177e4c3f41 Linus Torvalds  2005-04-16  477  				break;
^1da177e4c3f41 Linus Torvalds  2005-04-16  478  			result += err;
^1da177e4c3f41 Linus Torvalds  2005-04-16  479  			count -= err;
^1da177e4c3f41 Linus Torvalds  2005-04-16  480  			buf += err;
^1da177e4c3f41 Linus Torvalds  2005-04-16  481  		} else {
46397622a3fa83 Takashi Iwai    2023-05-23 @482  			if (copy_to_user(buf, &cell->event, aligned_size)) {

So smatch complains that this might be a read overflow.

^1da177e4c3f41 Linus Torvalds  2005-04-16  483  				err = -EFAULT;
^1da177e4c3f41 Linus Torvalds  2005-04-16  484  				break;
^1da177e4c3f41 Linus Torvalds  2005-04-16  485  			}
46397622a3fa83 Takashi Iwai    2023-05-23  486  			count -= aligned_size;
46397622a3fa83 Takashi Iwai    2023-05-23  487  			buf += aligned_size;
^1da177e4c3f41 Linus Torvalds  2005-04-16  488  		}
^1da177e4c3f41 Linus Torvalds  2005-04-16  489  		snd_seq_cell_free(cell);
^1da177e4c3f41 Linus Torvalds  2005-04-16  490  		cell = NULL; /* to be sure */
46397622a3fa83 Takashi Iwai    2023-05-23  491  		result += aligned_size;
^1da177e4c3f41 Linus Torvalds  2005-04-16  492  	}
^1da177e4c3f41 Linus Torvalds  2005-04-16  493  
^1da177e4c3f41 Linus Torvalds  2005-04-16  494  	if (err < 0) {
^1da177e4c3f41 Linus Torvalds  2005-04-16  495  		if (cell)
^1da177e4c3f41 Linus Torvalds  2005-04-16  496  			snd_seq_fifo_cell_putback(fifo, cell);
^1da177e4c3f41 Linus Torvalds  2005-04-16  497  		if (err == -EAGAIN && result > 0)
^1da177e4c3f41 Linus Torvalds  2005-04-16  498  			err = 0;
^1da177e4c3f41 Linus Torvalds  2005-04-16  499  	}
^1da177e4c3f41 Linus Torvalds  2005-04-16  500  	snd_seq_fifo_unlock(fifo);
^1da177e4c3f41 Linus Torvalds  2005-04-16  501  
^1da177e4c3f41 Linus Torvalds  2005-04-16  502  	return (err < 0) ? err : result;
^1da177e4c3f41 Linus Torvalds  2005-04-16  503  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

